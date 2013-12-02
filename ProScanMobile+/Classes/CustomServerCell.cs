using System;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using System.Drawing;

namespace ProScanMobile
{
	public class CustomServerCell: UITableViewCell  {

		UILabel hostLabel, portLabel, descLabel, countryLabel, stateLabel, countyLabel;
		UIImageView stateImageView;

		public CustomServerCell (NSString cellId) : base (UITableViewCellStyle.Default, cellId)
		{
			SelectionStyle = UITableViewCellSelectionStyle.Gray;

			hostLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 10f),
				BackgroundColor = UIColor.Clear
			};

			portLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 10f),
				BackgroundColor = UIColor.Clear
			};

			descLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 10f),
				BackgroundColor = UIColor.Clear
			};

			countryLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 8f),
				BackgroundColor = UIColor.Clear
			};

			stateLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 8f),
				BackgroundColor = UIColor.Clear
			};

			countyLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 8f),
				BackgroundColor = UIColor.Clear
			};

			stateImageView = new UIImageView ();

			ContentView.Add (stateImageView);
			ContentView.Add (hostLabel);
			ContentView.Add (portLabel);
			ContentView.Add (descLabel);
			ContentView.Add (countryLabel);
			ContentView.Add (stateLabel);
			ContentView.Add (countyLabel);
		}

		public void UpdateCell (UIImage image, string host, string port, string description, string country, string state, string county)
		{
			stateImageView.Image = image;
			hostLabel.Text = host;
			portLabel.Text = port;
			descLabel.Text = description;
			countryLabel.Text = country;
			stateLabel.Text = state;
			countyLabel.Text = county;
		}

		public override void LayoutSubviews ()
		{
			base.LayoutSubviews ();

			stateImageView.Frame = new RectangleF(1, 29, 4, 4);

			descLabel.Frame = new RectangleF(6, 4, ContentView.Bounds.Width, 20);
			hostLabel.Frame = new RectangleF(6, 21, 200, 20);
			portLabel.Frame = new RectangleF(205, 21, 50, 20);

			countryLabel.Frame = new RectangleF(6, 38, 100, 20);
			stateLabel.Frame = new RectangleF(105, 38, 100, 20);
			countyLabel.Frame = new RectangleF(205, 38, 100, 20);
		}
	}
}

