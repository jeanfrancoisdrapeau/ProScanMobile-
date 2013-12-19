using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.AVFoundation;

namespace ProScanMobile
{
	/// <summary>
	/// Class of the Recorder Screen
	/// </summary>
	public partial class vcRecordingsScreen : UIViewController
	{
		UITableView _tvMp3;

		public vcRecordingsScreen () : base ("vcRecordingsScreen", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			base.DidReceiveMemoryWarning ();
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			initInterface ();
		}

		private void initInterface()
		{
			_tvMp3 = new UITableView {
				Frame = new RectangleF (0, 23, UIScreen.MainScreen.Bounds.Width, UIScreen.MainScreen.Bounds.Height)
			};

			View.AddSubviews (new UIView[] { _tvMp3 });
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			this.NavigationController.SetNavigationBarHidden (true, animated);

			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var orderedFiles = Directory.GetFiles (documents, "proscanmobile_*.mp3")
				.Select (f => new FileInfo (f))
				.OrderBy (f => f.CreationTime);

			List<string> fileonly = new List<string> ();
			foreach (var file in orderedFiles) {
				fileonly.Add (file.Name);
			}

			_tvMp3.Source = new RecTableSource (fileonly.ToArray());
			_tvMp3.ReloadData ();
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
		}
	}
}

