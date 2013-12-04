using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

//TODO: AVAudioPlayer player = AVAudioPlayer.FRomUrl(NSUrl.FromFileName(fileName));
//player.PrepareToPlay();
//player.Play();

namespace ProScanMobile
{
	public partial class vcRecordingsScreen : UIViewController
	{
		UITableView _tvMp3;

		private class RecTableSource : UITableViewSource
		{
			string[] tableItems;
			string cellIdentifier = "MP3";
			public RecTableSource (string[] items)
			{
				tableItems = items;
			}
			public override int RowsInSection (UITableView tableview, int section)
			{
				return tableItems.Length;
			}
			public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
			{
				UITableViewCell cell = tableView.DequeueReusableCell (cellIdentifier);
				// if there are no cells to reuse, create a new one
				if (cell == null)
					cell = new UITableViewCell (UITableViewCellStyle.Default, cellIdentifier);
				cell.TextLabel.Text = tableItems[indexPath.Row];
				return cell;
			}
		}

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
				Frame = new RectangleF (0, 55, UIScreen.MainScreen.Bounds.Width, UIScreen.MainScreen.Bounds.Height - 185)
			};

			View.AddSubviews (new UIView[] { _tvMp3 });
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);

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
	}
}

