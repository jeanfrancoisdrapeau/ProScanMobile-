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
		NSObject observer;
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
			
			var rootNavigationController = new UINavigationController(); 

			vcMainScreen rootvc = new vcMainScreen ();

			rootNavigationController.PushViewController(rootvc, false); 
			
			// make the window visible
			window.RootViewController = rootNavigationController; 
			window.MakeKeyAndVisible ();

			UIApplication.SharedApplication.SetMinimumBackgroundFetchInterval (UIApplication.BackgroundFetchIntervalMinimum);

			return true;
		}

		public override void PerformFetch (UIApplication application, Action<UIBackgroundFetchResult> completionHandler)
		{
			// check for new data, and display it
			completionHandler (UIBackgroundFetchResult.NewData);
		}

		void DefaultsChanged (NSNotification obj)
		{
			//Settings.SetupByPreferences ();
		}

		public override void WillTerminate (UIApplication application)
		{
			if (observer != null) {
				NSNotificationCenter.DefaultCenter.RemoveObserver (observer);
				observer = null;
			}
		}
	}
}

