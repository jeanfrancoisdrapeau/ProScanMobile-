using System;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using System.Drawing;

namespace ProScanMobile
{
	public class CustomRecCell: UITableViewCell  {

		UILabel fileNameLabel;

		public CustomRecCell (NSString cellId) : base (UITableViewCellStyle.Default, cellId)
		{
			SelectionStyle = UITableViewCellSelectionStyle.Gray;

			fileNameLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 15f),
				BackgroundColor = UIColor.Clear
			};

			ContentView.Add (fileNameLabel);
		}

		public void UpdateCell (string fileName)
		{
			fileNameLabel.Text = fileName;
		}

		public override void LayoutSubviews ()
		{
			base.LayoutSubviews ();

			fileNameLabel.Frame = new RectangleF(5, 5, ContentView.Bounds.Width, 20);
		}
	}
}

