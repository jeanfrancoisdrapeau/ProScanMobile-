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
		public UINavigationController MainNavController { get; private set; }

		// class-level declarations
		UIWindow window;
		UITabBarController tabController;
		vcMainScreen viewControllerMainScreen;
		vcOptionsScreen viewControlerServersScreen;
		#if PLUS_VERSION
		vcRecordingsScreen viewControllerRecordingsScreen;
		#endif

		NSObject foregroundObserver;

		//
		// This method is invoked when the application has loaded and is ready to run. In this
		// method you should instantiate the window, load the UI into it and then make the window
		// visible.
		//
		// You have 17 seconds to return from this method, or iOS will terminate your application.
		//
		public override bool FinishedLaunching (UIApplication app, NSDictionary options)
		{
			foregroundObserver = NSNotificationCenter.DefaultCenter.AddObserver (
				UIApplication.DidBecomeActiveNotification, foregroundObserver_Notify);

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
		}

		public void foregroundObserver_Notify(NSNotification notification)
		{
			Console.WriteLine("Did become active.");

			UIApplication.SharedApplication.ApplicationIconBadgeNumber = -1;
			UIApplication.SharedApplication.ApplicationIconBadgeNumber = 0;
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
			//processNotification(userInfo, false);
		}

		void processNotification(NSDictionary options, bool fromFinishedLaunching)
		{
			//Check to see if the dictionary has the aps key.  This is the notification payload you would have sent
			if (null != options && options.ContainsKey(new NSString("aps")))
			{
				//Get the aps dictionary
				NSDictionary aps = options.ObjectForKey(new NSString("aps")) as NSDictionary;

				string alert = string.Empty;

				//Extract the alert text
				//NOTE: If you're using the simple alert by just specifying "  aps:{alert:"alert msg here"}  "
				//      this will work fine.  But if you're using a complex alert with Localization keys, etc., your "alert" object from the aps dictionary
				//      will be another NSDictionary... Basically the json gets dumped right into a NSDictionary, so keep that in mind
				if (aps.ContainsKey(new NSString("alert")))
					alert = (aps[new NSString("alert")] as NSString).ToString();

				//If this came from the ReceivedRemoteNotification while the app was running,
				// we of course need to manually process things like the sound, badge, and alert.
				if (!fromFinishedLaunching)
				{
					//Manually show an alert
					if (!string.IsNullOrEmpty(alert))
					{
						UIAlertView avAlert = new UIAlertView("Notification", alert, null, "OK", null);
						avAlert.Show();
					}
				}
			}
		}
	}
}

