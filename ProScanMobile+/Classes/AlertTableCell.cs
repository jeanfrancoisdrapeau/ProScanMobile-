using System;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.AVFoundation;
using System.Drawing;
using System.IO;

namespace ProScanMobile
{
	public class CustomLogCell: UITableViewCell  {

		private UILabel sysLabel, grpLabel;
		private UISwitch swEnableAlert;

		public CustomLogCell (NSString cellId) : base (UITableViewCellStyle.Default, cellId)
		{
			SelectionStyle = UITableViewCellSelectionStyle.None;

			sysLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 11f),
				BackgroundColor = UIColor.Clear
			};

			grpLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 11f),
				BackgroundColor = UIColor.Clear
			};

			swEnableAlert = new UISwitch ();
			swEnableAlert.ValueChanged += switchEnableAlertValueChanged_Event;

			ContentView.Add (sysLabel);
			ContentView.Add (grpLabel);
			ContentView.Add (swEnableAlert);
		}

		/// <summary>
		/// Updates the cell.
		/// </summary>
		/// <description>
		/// </description>
		/// <param name="fileName">File name.</param>
		public void UpdateCell (string sys, string grp, bool alert)
		{	
			sysLabel.Text = sys;
			grpLabel.Text = grp;
			swEnableAlert.On = alert;
		}

		private void switchEnableAlertValueChanged_Event(object sender, EventArgs e)
		{
			int i = -1;

			i = ScannerLog.log.LogsList.FindIndex(c => c.sys == sysLabel.Text &&
				c.grp == grpLabel.Text);

			if (i != -1) {
				ScannerLog.log.LogsList [i].alert = swEnableAlert.On;
			}
		}

		public override void LayoutSubviews ()
		{
			base.LayoutSubviews ();

			sysLabel.Frame = new RectangleF(5, 5, 200, 20);
			grpLabel.Frame = new RectangleF(5, 20, 200, 20);
			swEnableAlert.Frame = new RectangleF (UIScreen.MainScreen.Bounds.Width - 60, 5, 49, 31);
		}
	}
}

