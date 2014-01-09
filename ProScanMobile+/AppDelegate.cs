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
		// class-level declarations
		UIWindow window;
		UITabBarController tabController;
		vcMainScreen viewControllerMainScreen;
		vcOptionsScreen viewControlerServersScreen;
		#if PLUS_VERSION
		vcRecordingsScreen viewControllerRecordingsScreen;
		vcAlertsScreen viewControllerAlertsScreen;

		#endif

		//
		// This method is invoked when the application has loaded and is ready to run. In this
		// method you should instantiate the window, load the UI into it and then make the window
		// visible.
		//
		// You have 17 seconds to return from this method, or iOS will terminate your application.
		//
		public override bool FinishedLaunching (UIApplication app, NSDictionary options)
		{
			// create a new window instance based on the screen size
			window = new UIWindow (UIScreen.MainScreen.Bounds);

			tabController = new UITabBarController ();

			viewControllerMainScreen = new vcMainScreen ();
			viewControlerServersScreen = new vcOptionsScreen ();
			#if PLUS_VERSION
			viewControllerRecordingsScreen = new vcRecordingsScreen ();
			viewControllerAlertsScreen = new vcAlertsScreen ();
			#endif

			#if PLUS_VERSION
			tabController.ViewControllers = new UIViewController[] {
				viewControllerMainScreen,
				viewControlerServersScreen,
				viewControllerRecordingsScreen,
				viewControllerAlertsScreen
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
			tabController.ViewControllers [3].TabBarItem.Title = "Alerts";
			tabController.ViewControllers [3].TabBarItem.Image = UIImage.FromBundle ("Images/alert_button");
			#endif

			tabController.SelectedViewController = viewControllerMainScreen;

			UINavigationController rootNavigationController = new UINavigationController(tabController);

			// make the window visible
			window.RootViewController = rootNavigationController; 
			window.MakeKeyAndVisible ();

			return true;
		}

		#if PLUS_VERSION
		public override void ReceivedLocalNotification(UIApplication application, UILocalNotification notification)
		{
			// show an alert
			new UIAlertView(notification.AlertAction, notification.AlertBody, null, "OK", null).Show();
		}
		#endif
	}
}

