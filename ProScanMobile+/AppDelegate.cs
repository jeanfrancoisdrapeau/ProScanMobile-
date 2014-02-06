using System;
using System.Collections.Generic;
using System.Linq;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile
{
	// The UIApplicationDelegate for the application. This class is responsible for launching the
	// User Interface of the application, as well as listening (and optionally responding) to
	// application events from iOS.
	[Register ("AppDelegate")]
	public partial class AppDelegate : UIApplicationDelegate
	{
		public static AppDelegate Self { get; private set; }
		public static string launchWithCustomHostValue { get; private set; }
		public static string launchWithCustomPortValue { get; private set; }
		public UINavigationController MainNavController { get; private set; }

		private bool _appIsInBackground;

		// class-level declarations
		UIWindow window;
		UITabBarController tabController;
		vcMainScreen viewControllerMainScreen;
		vcOptionsScreen viewControlerServersScreen;
		#if PLUS_VERSION
		vcRecordingsScreen viewControllerRecordingsScreen;
		#endif

		NSObject foregroundObserver;
		NSObject backgroundObserver;

		//
		// This method is invoked when the application has loaded and is ready to run. In this
		// method you should instantiate the window, load the UI into it and then make the window
		// visible.
		//
		// You have 17 seconds to return from this method, or iOS will terminate your application.
		//
		public override bool FinishedLaunching (UIApplication app, NSDictionary options)
		{
			_appIsInBackground = false;

			foregroundObserver = NSNotificationCenter.DefaultCenter.AddObserver (
				UIApplication.DidBecomeActiveNotification, foregroundObserver_Notify);

			backgroundObserver = NSNotificationCenter.DefaultCenter.AddObserver (
				UIApplication.DidEnterBackgroundNotification, backgroundObserver_Notify);

			// create a new window instance based on the screen size
			window = new UIWindow (UIScreen.MainScreen.Bounds);

			tabController = new UITabBarController ();

			viewControllerMainScreen = new vcMainScreen ();
			viewControlerServersScreen = new vcOptionsScreen ();
			#if PLUS_VERSION
			viewControllerRecordingsScreen = new vcRecordingsScreen ();
			#endif

			#if PLUS_VERSION
			tabController.ViewControllers = new UIViewController[] {
				viewControllerMainScreen,
				viewControlerServersScreen,
				viewControllerRecordingsScreen
			};
			#else
			tabController.ViewControllers = new UIViewController[] {
				viewControllerMainScreen,
				viewControlerServersScreen
			};
			#endif
			tabController.ViewControllers [0].TabBarItem.Title = "Live";
			tabController.ViewControllers [0].TabBarItem.Image = UIImage.FromBundle ("Images/network_button");
			tabController.ViewControllers [1].TabBarItem.Title = "Servers";
			tabController.ViewControllers [1].TabBarItem.Image = UIImage.FromBundle ("Images/servers_button");
			#if PLUS_VERSION
			tabController.ViewControllers [2].TabBarItem.Title = "Recordings";
			tabController.ViewControllers [2].TabBarItem.Image = UIImage.FromBundle ("Images/folder_button");
			#endif

			tabController.SelectedViewController = viewControllerMainScreen;

			UINavigationController rootNavigationController = new UINavigationController(tabController);

			// make the window visible
			window.RootViewController = rootNavigationController; 
			window.MakeKeyAndVisible ();

			#if PLUS_VERSION
			//Register for remote notifications
			UIApplication.SharedApplication.RegisterForRemoteNotificationTypes(UIRemoteNotificationType.Alert
				| UIRemoteNotificationType.Badge
				| UIRemoteNotificationType.Sound);

			//The NSDictionary options variable would contain our notification data if the user clicked the 'view' button on the notification
			// to launch the application.  So you could process it here.  I find it nice to have one method to process these options from the
			// FinishedLaunching, as well as the ReceivedRemoteNotification methods.
			processNotification(options, true);

			#endif

			Self = this;
			this.MainNavController = rootNavigationController; // pass the nav controller's root controller in the constructor

			return true;
		}

		public override void WillTerminate (UIApplication application)
		{
			if (foregroundObserver != null) {
				NSNotificationCenter.DefaultCenter.RemoveObserver (foregroundObserver);
				foregroundObserver = null;
			}

			if (backgroundObserver != null) {
				NSNotificationCenter.DefaultCenter.RemoveObserver (backgroundObserver);
				backgroundObserver = null;
			}
		}

		public void foregroundObserver_Notify(NSNotification notification)
		{
			Console.WriteLine("Did become active.");

			UIApplication.SharedApplication.ApplicationIconBadgeNumber = -1;
			UIApplication.SharedApplication.ApplicationIconBadgeNumber = 0;

			_appIsInBackground = false;
		}

		public void backgroundObserver_Notify(NSNotification notification)
		{
			Console.WriteLine("Did become inactive.");

			_appIsInBackground = true;
		}

		public override void RegisteredForRemoteNotifications (UIApplication application, NSData deviceToken)
		{
			var oldDeviceToken = NSUserDefaults.StandardUserDefaults.StringForKey("PushDeviceToken");

			//There's probably a better way to do this
			var strFormat = new NSString("%@");
			var dt = new NSString(MonoTouch.ObjCRuntime.Messaging.IntPtr_objc_msgSend_IntPtr_IntPtr(new MonoTouch.ObjCRuntime.Class("NSString").Handle, new MonoTouch.ObjCRuntime.Selector("stringWithFormat:").Handle, strFormat.Handle, deviceToken.Handle));
			var newDeviceToken = dt.ToString().Replace("<", "").Replace(">", "").Replace(" ", "");

			if (string.IsNullOrEmpty(oldDeviceToken) || !deviceToken.Equals(newDeviceToken))
			{
				//TODO: Put your own logic here to notify your server that the device token has changed/been created!
			}

			//Save device token now
			NSUserDefaults.StandardUserDefaults.SetString(newDeviceToken, "PushDeviceToken");

			Console.WriteLine("Device Token: " + newDeviceToken);
		}

		public override void FailedToRegisterForRemoteNotifications (UIApplication application, NSError error)
		{
			Console.WriteLine("Failed to register for notifications");
		}

		public override void ReceivedRemoteNotification (UIApplication application, NSDictionary userInfo)
		{
			Console.WriteLine("Received Remote Notification!");
			processNotification(userInfo, _appIsInBackground);
		}

		void processNotification(NSDictionary options, bool background)
		{
			//You can also get the custom key/value pairs you may have sent in your aps (outside of the aps payload in the json)
			// This could be something like the ID of a new message that a user has seen, so you'd find the ID here and then skip displaying
			// the usual screen that shows up when the app is started, and go right to viewing the message, or something like that.

			if (null != options && options.ContainsKey(new NSString("host")))
			{
				launchWithCustomHostValue = (options[new NSString("host")] as NSString).ToString();
			}

			NetworkConnection nc = viewControllerMainScreen.getCurrentNetworkConnection();
			if (nc != null &&
			    nc.connectionStatus == NetworkConnection.ConnectionStatus.Connected &&
			    nc.currentHost == launchWithCustomHostValue)
				return;

			if (null != options && options.ContainsKey(new NSString("port")))
			{
				launchWithCustomPortValue = (options[new NSString("port")] as NSString).ToString();
			}

			if (!string.IsNullOrEmpty(launchWithCustomHostValue) && 
				!string.IsNullOrEmpty(launchWithCustomPortValue))
			{
				if (!background) {
					if (MessageBox.Show (string.Format ("Alert received from \n{0}\nWould like to connect to this server?", launchWithCustomHostValue),
						    NSBundle.MainBundle.ObjectForInfoDictionary ("CFBundleDisplayName").ToString (),
						    MessageBoxButton.YesNo) == MessageBoxResult.Yes) {
						viewControllerMainScreen.connectToHostAndBeginPlayback (launchWithCustomHostValue, launchWithCustomPortValue);
					}
				} else {
					viewControllerMainScreen.connectToHostAndBeginPlayback (launchWithCustomHostValue, launchWithCustomPortValue);
				}
			}
		}
	}
}

