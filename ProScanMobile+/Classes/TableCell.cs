using System;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.CoreGraphics;
using System.Drawing;

namespace ProScanMobile
{
	public class CustomServerCell: UITableViewCell  {

		UILabel hostLabel, portLabel, descLabel, countryLabel, stateLabel, countyLabel;
		UIImageView stateImageView;
		UnderlineButton btnReg, btnUnreg;
		UILabel alertLabel;

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

			alertLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 10f),
				BackgroundColor = UIColor.Clear,
				TextColor = UIColor.Red,
				Text = "Remote Alerts"
			};

			btnReg = new UnderlineButton () {
				Font = UIFont.FromName("AmericanTypewriter", 10f)
			};
			btnReg.SetTitle ("Register", UIControlState.Normal);
			btnReg.SetTitleColor (UIColor.Red, UIControlState.Normal);
			btnReg.TouchUpInside += btnRegTouchUpInside_Event;

			btnUnreg = new UnderlineButton () {
				Font = UIFont.FromName("AmericanTypewriter", 10f),
			};
			btnUnreg.SetTitle ("UnRegister", UIControlState.Normal);
			btnUnreg.SetTitleColor (UIColor.Red, UIControlState.Normal);
			btnUnreg.TouchUpInside += btnUnregTouchUpInside_Event;

			ContentView.Add (stateImageView);
			ContentView.Add (hostLabel);
			ContentView.Add (portLabel);
			ContentView.Add (descLabel);
			ContentView.Add (countryLabel);
			ContentView.Add (stateLabel);
			ContentView.Add (countyLabel);

			#if PLUS_VERSION
			ContentView.Add (alertLabel);
			ContentView.Add (btnReg);
			ContentView.Add (btnUnreg);
			#endif
		}

		private void btnRegTouchUpInside_Event(object sender, EventArgs e)
		{
			regOrUnregAlertService ();
		}

		private void btnUnregTouchUpInside_Event(object sender, EventArgs e)
		{
			regOrUnregAlertService (true);
		}

		private void regOrUnregAlertService (bool unreg = false)
		{
			if (string.IsNullOrEmpty(NSUserDefaults.StandardUserDefaults.StringForKey ("PushDeviceToken"))) {
				messageBoxShow (NSBundle.MainBundle.ObjectForInfoDictionary("CFBundleDisplayName").ToString(),
					"Cannot retrieve Device Notifications Key. Please make sure the application allowed to receive notifications.");
				return;
			}

			NetworkConnection networkConnection = new NetworkConnection (hostLabel.Text, 15000);
			networkConnection.connectDone.WaitOne ();

			if (networkConnection.connectionStatus == NetworkConnection.ConnectionStatus.Connected) {

				string prefix = (unreg ? "UNREG": "REG" );
				string message = string.Concat(prefix, NSUserDefaults.StandardUserDefaults.StringForKey("PushDeviceToken"));

				networkConnection.Send (message);
				networkConnection.sendDone.WaitOne ();

				networkConnection.Receive (NetworkConnection.ReceiveType.Alert);
				networkConnection.receiveDone.WaitOne ();

				messageBoxShow (NSBundle.MainBundle.ObjectForInfoDictionary("CFBundleDisplayName").ToString(),
					string.Concat("Server returned: ", networkConnection._receiveAlertStatusMessage));

			} else {
				messageBoxShow (NSBundle.MainBundle.ObjectForInfoDictionary("CFBundleDisplayName").ToString(),
					networkConnection._connectionStatusMessage);
			}
		}

		private void messageBoxShow(string Title, string Message)
		{
			InvokeOnMainThread (delegate {
				UIAlertView alert = new UIAlertView ();
				alert.Title = Title;
				alert.AddButton ("OK");
				//alert.AddButton ("Cancel");
				alert.Message = Message;
				alert.Show ();
			});
		}

		public class UnderlineButton : UIButton
		{
			public override void Draw (RectangleF rect)
			{
				base.Draw (rect);
				// Red underline
				using (CGContext context = UIGraphics.GetCurrentContext ()) {
					context.SetLineWidth(1);
					UIColor.Red.SetStroke ();

					//create geometry
					CGPath path = new CGPath ();

					path.AddLines(new PointF[]{
						new PointF(5, rect.Height -5),
						new PointF(rect.Width-5, rect.Height -5)});

					path.CloseSubpath();

					//add geometry to graphics context and draw it
					context.AddPath(path);
					context.DrawPath(CGPathDrawingMode.FillStroke);
				};
			}
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

			alertLabel.Frame = new RectangleF (6, 55, 75, 20);
			btnReg.Frame = new RectangleF (100, 55, 50, 20);
			btnUnreg.Frame = new RectangleF (155, 55, 60, 20);
		}
	}
}

