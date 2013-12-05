using System;
using System.Drawing;
using System.Collections.Generic;
using System.Timers;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using GCDiscreetNotification;
using MonoTouch.AudioToolbox;
using MonoTouch.AVFoundation;

namespace ProScanMobile
{
	public partial class vcMainScreen : UIViewController
	{
		GCDiscreetNotificationView notificationView;

		SystemSound _soundConnected;
		SystemSound _soundDisconnected;

		vcOptionsScreen optionScreen = new vcOptionsScreen();

		UIScrollView _scrollView;

		UIImageView ivScannerBars;

		UILabel lblScannerType, lblScannerDisplay1, lblScannerDisplay2, lblScannerDisplay3, lblScannerDisplay4, lblScannerDisplay5;
		UILabel lblServerHostname, lblServerLocation; 
		UILabel	lblMpegLayer, lblMpegFrequency, lblMpegRate;
		UILabel lblTime, lblBytes;
		UILabel lblRecording;
		UILabel lblAppVersion, lblAppCreator;

		UIButton btnPlay, btnRec, btnStop, btnOptions;

		NetworkConnection networkConnection;

		const int INDEX_MESSAGE_TYPE = 0;
		const int INDEX_MESSAGE_LENGTH = 9;
		const int INDEX_MESSAGE_SEQ = 15;

		const int BYTES_MESSAGE_TYPE = 8;
		const int BYTES_MESSAGE_LENGTH = 5;
		const int BYTES_MESSAGE_SEQ = 5;

		const int MIN_MESSAGE_LENGTH = 14;

		const string MESSAGE_TYPE_STARTDAT = "STARTDAT";
		const string MESSAGE_TYPE_STARTAUD = "STARTAUD";

		ScannerAudio _scannerAudio;
		ScannerScreen _scannerScreen;

		private Timer _timer;
		private DateTime _timerCounter;
		private DateTime _startTime;

		private int _lastBytesReceived;

		private bool _recordAudio = false;

		public vcMainScreen () : base ("vcMainScreen", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			base.DidReceiveMemoryWarning ();
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			this.NavigationController.SetNavigationBarHidden (true, animated);
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			initInterface ();

			// Initialise audio
			NSError error;
			AVAudioSession audioInstance = AVAudioSession.SharedInstance();
			audioInstance.SetActive(true, AVAudioSessionSetActiveOptions.NotifyOthersOnDeactivation, out error);
			audioInstance.SetCategory(new NSString("AVAudioSessionCategoryPlayback"), out error);

			if (error != null) {
			}

			optionScreen.GetSettings ();

			if (optionScreen.ServerAutoConnect)
				connectToHostAndBeginPlayback ();
		}

		private void initInterface()
		{
			_timer = new System.Timers.Timer ();

			_timer.Interval = 250;
			_timer.Elapsed += new System.Timers.ElapsedEventHandler(timerElapsed);

			_soundConnected = SystemSound.FromFile ("Sounds/connected.mp3");
			_soundDisconnected = SystemSound.FromFile ("Sounds/disconnected.mp3");

			// All the labels
			lblScannerType = new UILabel {
				Frame = new RectangleF (20, 32, 250, 14)
			};
			lblScannerType.Text = "Uniden";
			lblScannerType.Font = UIFont.FromName("LED Display7", 20f);

			ivScannerBars = new UIImageView {
				Frame = new RectangleF (UIScreen.MainScreen.Bounds.Width - 50, 32, 19, 14),
			};

			lblScannerDisplay1 = new UILabel {
				Frame = new RectangleF (5, 50, 310, 35)
			};
			lblScannerDisplay1.TextAlignment = UITextAlignment.Center;
			lblScannerDisplay1.Text = "System";
			lblScannerDisplay1.Font = UIFont.FromName("LED Display7", 30f);

			lblScannerDisplay2 = new UILabel {
				Frame = new RectangleF (5, 75, 310, 35)
			};
			lblScannerDisplay2.TextAlignment = UITextAlignment.Center;
			lblScannerDisplay2.Text = "Group";
			lblScannerDisplay2.Font = UIFont.FromName("LED Display7", 30f);

			lblScannerDisplay3 = new UILabel {
				Frame = new RectangleF (5, 100, 310, 35)
			};
			lblScannerDisplay3.TextAlignment = UITextAlignment.Center;
			lblScannerDisplay3.Text = "123.456";
			lblScannerDisplay3.Font = UIFont.FromName("LED Display7", 30f);

			lblScannerDisplay4 = new UILabel {
				Frame = new RectangleF (5, 125, 310, 35)
			};
			lblScannerDisplay4.TextAlignment = UITextAlignment.Center;
			lblScannerDisplay4.Text = "S1:1234567890";
			lblScannerDisplay4.Font = UIFont.FromName("LED Display7", 30f);

			lblScannerDisplay5 = new UILabel {
				Frame = new RectangleF (5, 150, 310, 35)
			};
			lblScannerDisplay5.TextAlignment = UITextAlignment.Center;
			lblScannerDisplay5.Text = "GRP1234567890";
			lblScannerDisplay5.Font = UIFont.FromName("LED Display7", 30f);

			lblServerHostname = new UILabel {
				Frame = new RectangleF (10, 180, 305, 35)
			};
			lblServerHostname.TextAlignment = UITextAlignment.Left;
			lblServerHostname.Text = "Server hostname";
			lblServerHostname.Font = UIFont.FromName("LED Display7", 12f);

			lblServerLocation = new UILabel {
				Frame = new RectangleF (10, 190, 305, 35)
			};
			lblServerLocation.TextAlignment = UITextAlignment.Left;
			lblServerLocation.Text = "County, State, Country";
			lblServerLocation.Font = UIFont.FromName("LED Display7", 10f);

			lblMpegLayer = new UILabel {
				Frame = new RectangleF (10, 205, 125, 35)
			};
			lblMpegLayer.TextAlignment = UITextAlignment.Left;
			lblMpegLayer.Text = "MPEG ?, LYR ?";
			lblMpegLayer.Font = UIFont.FromName("LED Display7", 10f);

			lblMpegFrequency = new UILabel {
				Frame = new RectangleF (10, 215, 100, 35)
			};
			lblMpegFrequency.TextAlignment = UITextAlignment.Left;
			lblMpegFrequency.Text = "0 Hz";
			lblMpegFrequency.Font = UIFont.FromName("LED Display7", 10f);

			lblMpegRate = new UILabel {
				Frame = new RectangleF (10, 225, 100, 35)
			};
			lblMpegRate.TextAlignment = UITextAlignment.Left;
			lblMpegRate.Text = "0 Bps";
			lblMpegRate.Font = UIFont.FromName("LED Display7", 10f);

			lblTime = new UILabel {
				Frame = new RectangleF (160, 205, 150, 35)
			};
			lblTime.TextAlignment = UITextAlignment.Right;
			lblTime.Text = "00:00:00.00";
			lblTime.Font = UIFont.FromName("LED Display7", 15f);

			lblBytes = new UILabel {
				Frame = new RectangleF (160, 225, 150, 35)
			};
			lblBytes.TextAlignment = UITextAlignment.Right;
			lblBytes.Text = "0B";
			lblBytes.Font = UIFont.FromName("LED Display7", 15f);

			lblRecording = new UILabel {
				Frame = new RectangleF ((UIScreen.MainScreen.Bounds.Width / 2) - 85, 240, 175, 35)
			};
			lblRecording.TextAlignment = UITextAlignment.Center;
			lblRecording.TextColor = UIColor.Red;
			lblRecording.Text = string.Empty;
			lblRecording.Font = UIFont.FromName("LED Display7", 15f);

			lblAppVersion = new UILabel {
				Frame = new RectangleF (140, UIScreen.MainScreen.Bounds.Height - 71, 180, 17)
			};
			lblAppVersion.TextAlignment = UITextAlignment.Right;
			lblAppVersion.Text = string.Format("ProScanMobile+ {0}", NSBundle.MainBundle.ObjectForInfoDictionary("CFBundleVersion").ToString());
			lblAppVersion.Font = UIFont.FromName("LED Display7", 8f);

			lblAppCreator = new UILabel {
				Frame = new RectangleF (140, UIScreen.MainScreen.Bounds.Height - 65, 180, 17)
			};
			lblAppCreator.TextAlignment = UITextAlignment.Right;
			lblAppCreator.Text = "(c) 2013 Jean-Francois Drapeau";
			lblAppCreator.Font = UIFont.FromName("LED Display7", 8f);

			// Scanner display
			UIImageView ivScannerDisplay = new UIImageView {
				Frame = new RectangleF (5, 23, UIScreen.MainScreen.Bounds.Width - 10, 249),
				Image = UIImage.FromBundle("Images/scanner_display.jpg")
			};

			// Rec button
			btnRec = new UIButton {
				Frame = new RectangleF(5, 0, 40, 40)
			};
			btnRec.Layer.CornerRadius = 9.5f;
			btnRec.Layer.MasksToBounds = true;
			btnRec.ClipsToBounds = true;
			btnRec.SetImage(UIImage.FromBundle("Images/rec_activate_button.jpg"), UIControlState.Normal);
			btnRec.TouchUpInside += btnRecTouchUpInside_Event;

			// Play button
			btnPlay = new UIButton {
				Frame = new RectangleF(50, 0, 40, 40)
			};
			btnPlay.Layer.CornerRadius = 9.5f;
			btnPlay.Layer.MasksToBounds = true;
			btnPlay.ClipsToBounds = true;
			btnPlay.SetImage(UIImage.FromBundle("Images/green_button.jpg"), UIControlState.Normal);
			btnPlay.TouchUpInside += btnPlayTouchUpInside_Event;

			// Stop button
			btnStop = new UIButton {
				Frame = new RectangleF(95, 0, 40, 40)
			};
			btnStop.Enabled = false;
			btnStop.Layer.CornerRadius = 9.5f;
			btnStop.Layer.MasksToBounds = true;
			btnStop.ClipsToBounds = true;
			btnStop.SetImage(UIImage.FromBundle("Images/red_button.jpg"), UIControlState.Normal);
			btnStop.TouchUpInside += btnStopTouchUpInside_Event;

			// Options button
			btnOptions = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width - 45, 0, 40, 40)
			};
			btnOptions.Layer.CornerRadius = 9.5f;
			btnOptions.Layer.MasksToBounds = true;
			btnOptions.ClipsToBounds = true;
			btnOptions.SetImage(UIImage.FromBundle("Images/config_button.jpg"), UIControlState.Normal);
			btnOptions.TouchUpInside += (sender, e) => {
				this.NavigationController.PushViewController(optionScreen, true);
			};

			// Scanner buttons
			UIButton btnScanner_Func = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 20, 0, 55, 25)
			};
			btnScanner_Func.Tag = 1; //"btnScanner_Func"
			btnScanner_Func.Layer.CornerRadius = 11.0f;
			btnScanner_Func.Layer.MasksToBounds = true;
			btnScanner_Func.ClipsToBounds = true;
			btnScanner_Func.SetImage(UIImage.FromBundle("Images/scanner_button_func.jpg"), UIControlState.Normal);
			btnScanner_Func.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_1 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 75, 0, 55, 25)
			};
			btnScanner_1.Tag = 2; //"btnScanner_1"
			btnScanner_1.Layer.CornerRadius = 11.0f;
			btnScanner_1.Layer.MasksToBounds = true;
			btnScanner_1.ClipsToBounds = true;
			btnScanner_1.SetImage(UIImage.FromBundle("Images/scanner_button_1.jpg"), UIControlState.Normal);
			btnScanner_1.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_2 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 130, 0, 55, 25)
			};
			btnScanner_2.Tag = 3; //"btnScanner_2"
			btnScanner_2.Layer.CornerRadius = 11.0f;
			btnScanner_2.Layer.MasksToBounds = true;
			btnScanner_2.ClipsToBounds = true;
			btnScanner_2.SetImage(UIImage.FromBundle("Images/scanner_button_2.jpg"), UIControlState.Normal);
			btnScanner_2.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_3 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 185, 0, 55, 25)
			};
			btnScanner_3.Tag = 4; //"btnScanner_3"
			btnScanner_3.Layer.CornerRadius = 11.0f;
			btnScanner_3.Layer.MasksToBounds = true;
			btnScanner_3.ClipsToBounds = true;
			btnScanner_3.SetImage(UIImage.FromBundle("Images/scanner_button_3.jpg"), UIControlState.Normal);
			btnScanner_3.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Scan = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 240, 0, 55, 25)
			};
			btnScanner_Scan.Tag = 5; //"btnScanner_Scan"
			btnScanner_Scan.Layer.CornerRadius = 11.0f;
			btnScanner_Scan.Layer.MasksToBounds = true;
			btnScanner_Scan.ClipsToBounds = true;
			btnScanner_Scan.SetImage(UIImage.FromBundle("Images/scanner_button_scan.jpg"), UIControlState.Normal);
			btnScanner_Scan.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Menu = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 20, 25, 55, 25)
			};
			btnScanner_Menu.Tag = 6; //"btnScanner_Menu"
			btnScanner_Menu.Layer.CornerRadius = 11.0f;
			btnScanner_Menu.Layer.MasksToBounds = true;
			btnScanner_Menu.ClipsToBounds = true;
			btnScanner_Menu.SetImage(UIImage.FromBundle("Images/scanner_button_menu.jpg"), UIControlState.Normal);
			btnScanner_Menu.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_4 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 75, 25, 55, 25)
			};
			btnScanner_4.Tag = 7; //"btnScanner_4"
			btnScanner_4.Layer.CornerRadius = 11.0f;
			btnScanner_4.Layer.MasksToBounds = true;
			btnScanner_4.ClipsToBounds = true;
			btnScanner_4.SetImage(UIImage.FromBundle("Images/scanner_button_4.jpg"), UIControlState.Normal);
			btnScanner_4.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_5 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 130, 25, 55, 25)
			};
			btnScanner_5.Tag = 8; //"btnScanner_5"
			btnScanner_5.Layer.CornerRadius = 11.0f;
			btnScanner_5.Layer.MasksToBounds = true;
			btnScanner_5.ClipsToBounds = true;
			btnScanner_5.SetImage(UIImage.FromBundle("Images/scanner_button_5.jpg"), UIControlState.Normal);
			btnScanner_5.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_6 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 185, 25, 55, 25)
			};
			btnScanner_6.Tag = 9; //"btnScanner_6"
			btnScanner_6.Layer.CornerRadius = 11.0f;
			btnScanner_6.Layer.MasksToBounds = true;
			btnScanner_6.ClipsToBounds = true;
			btnScanner_6.SetImage(UIImage.FromBundle("Images/scanner_button_6.jpg"), UIControlState.Normal);
			btnScanner_6.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Hold = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 240, 25, 55, 25)
			};
			btnScanner_Hold.Tag = 10; //"btnScanner_Hold"
			btnScanner_Hold.Layer.CornerRadius = 11.0f;
			btnScanner_Hold.Layer.MasksToBounds = true;
			btnScanner_Hold.ClipsToBounds = true;
			btnScanner_Hold.SetImage(UIImage.FromBundle("Images/scanner_button_hold.jpg"), UIControlState.Normal);
			btnScanner_Hold.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_LO = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 20, 50, 55, 25)
			};
			btnScanner_LO.Tag = 11; //"btnScanner_LO"
			btnScanner_LO.Layer.CornerRadius = 11.0f;
			btnScanner_LO.Layer.MasksToBounds = true;
			btnScanner_LO.ClipsToBounds = true;
			btnScanner_LO.SetImage(UIImage.FromBundle("Images/scanner_button_lockout.jpg"), UIControlState.Normal);
			btnScanner_LO.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_7 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 75, 50, 55, 25)
			};
			btnScanner_7.Tag = 12; //"btnScanner_7"
			btnScanner_7.Layer.CornerRadius = 11.0f;
			btnScanner_7.Layer.MasksToBounds = true;
			btnScanner_7.ClipsToBounds = true;
			btnScanner_7.SetImage(UIImage.FromBundle("Images/scanner_button_7.jpg"), UIControlState.Normal);
			btnScanner_7.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_8 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 130, 50, 55, 25)
			};
			btnScanner_8.Tag = 13; //"btnScanner_8"
			btnScanner_8.Layer.CornerRadius = 11.0f;
			btnScanner_8.Layer.MasksToBounds = true;
			btnScanner_8.ClipsToBounds = true;
			btnScanner_8.SetImage(UIImage.FromBundle("Images/scanner_button_8.jpg"), UIControlState.Normal);
			btnScanner_8.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_9 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 185, 50, 55, 25)
			};
			btnScanner_9.Tag = 14; //"btnScanner_9"
			btnScanner_9.Layer.CornerRadius = 11.0f;
			btnScanner_9.Layer.MasksToBounds = true;
			btnScanner_9.ClipsToBounds = true;
			btnScanner_9.SetImage(UIImage.FromBundle("Images/scanner_button_9.jpg"), UIControlState.Normal);
			btnScanner_9.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Left = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 20, 75, 55, 25)
			};
			btnScanner_Left.Tag = 15; //"btnScanner_Left"
			btnScanner_Left.Layer.CornerRadius = 11.0f;
			btnScanner_Left.Layer.MasksToBounds = true;
			btnScanner_Left.ClipsToBounds = true;
			btnScanner_Left.SetImage(UIImage.FromBundle("Images/scanner_button_left.jpg"), UIControlState.Normal);
			btnScanner_Left.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_No = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 75, 75, 55, 25)
			};
			btnScanner_No.Tag = 16; //"btnScanner_No"
			btnScanner_No.Layer.CornerRadius = 11.0f;
			btnScanner_No.Layer.MasksToBounds = true;
			btnScanner_No.ClipsToBounds = true;
			btnScanner_No.SetImage(UIImage.FromBundle("Images/scanner_button_no.jpg"), UIControlState.Normal);
			btnScanner_No.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_0 = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 130, 75, 55, 25)
			};
			btnScanner_0.Tag = 17; //"btnScanner_0"
			btnScanner_0.Layer.CornerRadius = 11.0f;
			btnScanner_0.Layer.MasksToBounds = true;
			btnScanner_0.ClipsToBounds = true;
			btnScanner_0.SetImage(UIImage.FromBundle("Images/scanner_button_0.jpg"), UIControlState.Normal);
			btnScanner_0.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Eyes = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 185, 75, 55, 25)
			};
			btnScanner_Eyes.Tag = 18; //"btnScanner_Eyes"
			btnScanner_Eyes.Layer.CornerRadius = 11.0f;
			btnScanner_Eyes.Layer.MasksToBounds = true;
			btnScanner_Eyes.ClipsToBounds = true;
			btnScanner_Eyes.SetImage(UIImage.FromBundle("Images/scanner_button_eyes.jpg"), UIControlState.Normal);
			btnScanner_Eyes.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Right = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 240, 75, 55, 25)
			};
			btnScanner_Right.Tag = 19; //"btnScanner_Right"
			btnScanner_Right.Layer.CornerRadius = 11.0f;
			btnScanner_Right.Layer.MasksToBounds = true;
			btnScanner_Right.ClipsToBounds = true;
			btnScanner_Right.SetImage(UIImage.FromBundle("Images/scanner_button_right.jpg"), UIControlState.Normal);
			btnScanner_Right.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_FuncH = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 20, 100, 55, 25)
			};
			btnScanner_FuncH.Tag = 20; //"btnScanner_FuncH"
			btnScanner_FuncH.Layer.CornerRadius = 11.0f;
			btnScanner_FuncH.Layer.MasksToBounds = true;
			btnScanner_FuncH.ClipsToBounds = true;
			btnScanner_FuncH.SetImage(UIImage.FromBundle("Images/scanner_button_funch.jpg"), UIControlState.Normal);
			btnScanner_FuncH.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_FuncR = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 75, 100, 55, 25)
			};
			btnScanner_FuncR.Tag = 21; //"btnScanner_FuncR"
			btnScanner_FuncR.Layer.CornerRadius = 11.0f;
			btnScanner_FuncR.Layer.MasksToBounds = true;
			btnScanner_FuncR.ClipsToBounds = true;
			btnScanner_FuncR.SetImage(UIImage.FromBundle("Images/scanner_button_funcr.jpg"), UIControlState.Normal);
			btnScanner_FuncR.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Push = new UIButton {
				Frame = new RectangleF(UIScreen.MainScreen.Bounds.Width + 130, 100, 55, 25)
			};
			btnScanner_Push.Tag = 22; //"btnScanner_Push"
			btnScanner_Push.Layer.CornerRadius = 11.0f;
			btnScanner_Push.Layer.MasksToBounds = true;
			btnScanner_Push.ClipsToBounds = true;
			btnScanner_Push.SetImage(UIImage.FromBundle("Images/scanner_button_push.jpg"), UIControlState.Normal);
			btnScanner_Push.TouchUpInside += btnScannerTouchUpInside_Event;

			// Scrollview for Play, Stop, Options and Scanner controls
			_scrollView = new UIScrollView {
				Frame = new RectangleF (0, 275, UIScreen.MainScreen.Bounds.Width,
					125),
				ContentSize = new SizeF (UIScreen.MainScreen.Bounds.Width * 2, 125),
				BackgroundColor = UIColor.White,
				AutoresizingMask = UIViewAutoresizing.FlexibleWidth,
				PagingEnabled = true,
				ShowsHorizontalScrollIndicator = false
			};

			_scrollView.Layer.MasksToBounds = true;
			//_scrollView.Layer.ShadowColor = UIColor.DarkGray.CGColor;
			//_scrollView.Layer.ShadowOpacity = 0.1f;
			//_scrollView.Layer.ShadowRadius = 1.0f;
			//_scrollView.Layer.ShadowOffset = new System.Drawing.SizeF(0f, 3f);

			_scrollView.AddSubviews (new UIView[] { btnPlay, btnRec,
				btnStop, 
				btnOptions });

			_scrollView.AddSubviews (new UIView[] { btnScanner_Func, btnScanner_1, btnScanner_2, btnScanner_3, btnScanner_Scan,
				btnScanner_Menu, btnScanner_4, btnScanner_5, btnScanner_6, btnScanner_Hold, 
				btnScanner_LO, btnScanner_7, btnScanner_8, btnScanner_9, 
				btnScanner_Left, btnScanner_No, btnScanner_0, btnScanner_Eyes, btnScanner_Right,
				btnScanner_FuncH, btnScanner_FuncR, btnScanner_Push
			 });

			// Add everything to current view
			View.AddSubviews (new UIView[] { ivScannerDisplay, lblScannerType, ivScannerBars,
				lblScannerDisplay1, lblScannerDisplay2, lblScannerDisplay3, lblScannerDisplay4, lblScannerDisplay5,
				lblServerHostname, lblServerLocation,
				lblMpegLayer, lblMpegFrequency, lblMpegRate,
				lblTime, lblBytes,
				lblRecording,
				_scrollView,
				lblAppVersion, lblAppCreator
			});
		}

		private void btnScannerTouchUpInside_Event(object sender, EventArgs e)
		{
			if (networkConnection == null)
				return;
			if (networkConnection.connectionStatus != NetworkConnection.ConnectionStatus.Connected)
				return;
			if (networkConnection.loginStatus != NetworkConnection.LoginStatus.LoggedIn)
				return;

			UIButton btn = (UIButton)sender;

			string message = string.Empty;

			switch((int)btn.Tag) {
			case 1: //"btnScanner_Func":
				message = "STARTDAT 00034 PS31 KEY,F,P ENDDAT";
				break;
			case 2: //"btnScanner_1":
				message = "STARTDAT 00034 PS31 KEY,1,P ENDDAT";
				break;
			case 3: //"btnScanner_2":
				message = "STARTDAT 00034 PS31 KEY,2,P ENDDAT";
				break;
			case 4: //"btnScanner_3":
				message = "STARTDAT 00034 PS31 KEY,2,P ENDDAT";
				break;
			case 5: //"btnScanner_Scan":
				message = "STARTDAT 00034 PS31 KEY,S,P ENDDAT";
				break;
			case 6: //"btnScanner_Menu":
				message = "STARTDAT 00034 PS31 KEY,M,P ENDDAT";
				break;
			case 7: //"btnScanner_4":
				message = "STARTDAT 00034 PS31 KEY,4,P ENDDAT";
				break; 
			case 8: //"btnScanner_5":
				message = "STARTDAT 00034 PS31 KEY,5,P ENDDAT";
				break;
			case 9: //"btnScanner_6":
				message = "STARTDAT 00034 PS31 KEY,6,P ENDDAT";
				break;
			case 10: //"btnScanner_Hold":
				message = "STARTDAT 00034 PS31 KEY,H,P ENDDAT";
				break;
			case 11: //"btnScanner_LO":
				message = "STARTDAT 00034 PS31 KEY,L,P ENDDAT";
				break;
			case 12: //"btnScanner_7":
				message = "STARTDAT 00034 PS31 KEY,7,P ENDDAT";
				break;
			case 13: //"btnScanner_8":
				message = "STARTDAT 00034 PS31 KEY,8,P ENDDAT";
				break;
			case 14: //"btnScanner_9,":
				message = "STARTDAT 00034 PS31 KEY,9,P ENDDAT";
				break;
			case 15: //"btnScanner_Left":
				message = "STARTDAT 00034 PS31 KEY,<,P ENDDAT";
				break;
			case 16: //"btnScanner_No":
				message = "STARTDAT 00034 PS31 KEY,.,P ENDDAT";
				break;
			case 17: //"btnScanner_0":
				message = "STARTDAT 00034 PS31 KEY,0,P ENDDAT";
				break;
			case 18: //"btnScanner_Eyes":
				message = "STARTDAT 00034 PS31 KEY,E,P ENDDAT";
				break;
			case 19: //"btnScanner_Right":
				message = "STARTDAT 00034 PS31 KEY,>,P ENDDAT";
				break;
			case 20: //"btnScanner_FuncH":
				message = "STARTDAT 00034 PS31 KEY,F,H ENDDAT";
				break;
			case 21: //"btnScanner_FuncR":
				message = "STARTDAT 00042 PS31 KEY,F,R\nKEY,F,P ENDDAT";
				break;
			case 22: //"btnScanner_Push":
				break;
			}

			networkConnection.Send (message);
			networkConnection.sendDone.WaitOne ();
			if (networkConnection.sendStatus != NetworkConnection.SendStatus.Ok)
				messageBoxShow ("ProScanMobile+", networkConnection._sendStatusMessage);
		}

		private void btnPlayTouchUpInside_Event(object sender, EventArgs e)
		{
			connectToHostAndBeginPlayback ();
		}

		private void connectToHostAndBeginPlayback()
		{
			notificationView = new GCDiscreetNotificationView (
				text: "Connecting...",
				activity: true,
				presentationMode: GCDNPresentationMode.Bottom,
				view: View
			);

			notificationView.Show (animated: false);

			networkConnection = new NetworkConnection (optionScreen.ServerHostName, optionScreen.ServerHostPort);
			networkConnection.connectDone.WaitOne ();

			string password = optionScreen.ServerPassWord;

			if (networkConnection.connectionStatus == NetworkConnection.ConnectionStatus.Connected) {

				notificationView.SetTextLabel ("Login in...", false);
				networkConnection.Login (string.Format("STARTDAT 00048 PS17,VERSION=6.6,PASSWORD={0} ENDDAT", 
					password.Length == 0 ? string.Empty : password));
				networkConnection.loginDone.WaitOne ();

				if (networkConnection.loginStatus == NetworkConnection.LoginStatus.LoggedIn) {

					_soundConnected.PlaySystemSound ();

					notificationView.SetTextLabel ("Buffering...", false);

					btnPlay.Enabled = false;
					btnStop.Enabled = true;
					btnOptions.Enabled = false;

					_scannerAudio = new ScannerAudio ();
					_scannerScreen = new ScannerScreen ();

					_startTime = DateTime.Now;
					_timerCounter = DateTime.Now;
					_timer.Start ();

				} else {
					if (!notificationView.Hidden)
						notificationView.Hide (animated: true);

					messageBoxShow ("ProScanMobile+", networkConnection._loginStatusMessage);

					networkConnection.LogOut ("STARTDAT 00026 PS05 ENDDAT");
					networkConnection.logoutDone.WaitOne ();

					networkConnection.Close ();
					networkConnection.closeDone.WaitOne ();
				}
			} else {
				if (!notificationView.Hidden)
					notificationView.Hide (animated: true);

				messageBoxShow ("ProScanMobile+", networkConnection._connectionStatusMessage);
			}
		}

		private void btnRecTouchUpInside_Event(object sender, EventArgs e)
		{
			_recordAudio = _recordAudio == true ? false : true;

			string img = string.Empty;
			if (_recordAudio) {
				if (_scannerAudio != null) {
					_scannerAudio.PrepareOutputToFile ();
				}
					
				img = "rec_deactivate_button.jpg";
			} else {
				if (_scannerAudio != null) {
					_scannerAudio.StopOutputToFile ();
				}

				img = "rec_activate_button.jpg";
			}
			btnRec.SetImage(UIImage.FromBundle("Images/" + img), UIControlState.Normal);
		}

		private void btnStopTouchUpInside_Event(object sender, EventArgs e)
		{
			_soundDisconnected.PlaySystemSound ();

			_timer.Stop ();

			_scannerAudio.Dispose ();
			_scannerScreen.Dispose ();

			networkConnection.LogOut ("STARTDAT 00026 PS05 ENDDAT");
			networkConnection.logoutDone.WaitOne ();

			networkConnection.Close ();
			networkConnection.closeDone.WaitOne ();

			btnPlay.Enabled = true;
			btnStop.Enabled = false;
			btnOptions.Enabled = true;
		}

		private void timerElapsed(object sender, System.Timers.ElapsedEventArgs e)
		{   
			try
			{
				if (networkConnection.connectionStatus == NetworkConnection.ConnectionStatus.Connected) {

					if (_lastBytesReceived != networkConnection.bytesReceived) {
						_lastBytesReceived = networkConnection.bytesReceived;
						_timerCounter = DateTime.Now;
					}

					TimeSpan ts = DateTime.Now - _timerCounter;

					if (ts.TotalSeconds > 5 ||
						networkConnection.receiveDataStatus == NetworkConnection.SendStatus.Error) {

						_soundDisconnected.PlaySystemSound ();

						if (networkConnection.receiveDataStatus == NetworkConnection.SendStatus.Error)
							messageBoxShow ("ProScanMobile+", networkConnection._receiveDataStatusMessage);

						_scannerAudio.Dispose ();
						_scannerScreen.Dispose ();

						networkConnection.Close ();
						networkConnection.closeDone.WaitOne ();

						_timer.Stop ();

						BeginInvokeOnMainThread (delegate {
							btnPlay.Enabled = true;
							btnStop.Enabled = false;
							btnOptions.Enabled = true;
						});
					}

					if (networkConnection.connectionBuffer.Count > 0)
					{
						int i_messageLength;
						byte[] b_messageLength = new byte[BYTES_MESSAGE_LENGTH];
						Array.ConstrainedCopy (networkConnection.connectionBuffer.Read(14, true), 
							INDEX_MESSAGE_LENGTH, b_messageLength, 0, BYTES_MESSAGE_LENGTH);

						//Console.WriteLine("---------- b_messageLength........: {0} (first bytes of data buffer)", bytesToString(b_messageLength));

						int.TryParse (bytesToString (b_messageLength), out i_messageLength);

						//Console.WriteLine("---------- Message length.........: {0} (first bytes of data buffer)", i_messageLength.ToString());

						bool continueParse = true;
						while (continueParse)
						{
							if (networkConnection.connectionBuffer.Count < i_messageLength)
							{
								//Console.WriteLine("---------- **** MESSAGE LENGTH GREATER THAN DATABUFFER **** ----------");
								continueParse = false;
							} else {

								byte[] messageReceived = new byte[i_messageLength];
								messageReceived = networkConnection.connectionBuffer.Read(i_messageLength);
								//Console.WriteLine("---------- m_listDataBuffer while.: {0}", networkConnection.connectionBuffer.Count.ToString());

								byte[] b_messageType = new byte[BYTES_MESSAGE_TYPE];
								Array.ConstrainedCopy (messageReceived, INDEX_MESSAGE_TYPE, 
									b_messageType, 0, BYTES_MESSAGE_TYPE);

								//Console.WriteLine(i_messageLength.ToString());
								// Based on message type...
								switch (bytesToString (b_messageType))
								{
								case MESSAGE_TYPE_STARTAUD:
									_scannerAudio.processData(messageReceived, i_messageLength);
									break;
								case MESSAGE_TYPE_STARTDAT:
									_scannerScreen.processData(messageReceived, i_messageLength);
									break;
								}

								if (networkConnection.connectionBuffer.Count == 0 || 
									networkConnection.connectionBuffer.Count < MIN_MESSAGE_LENGTH)
								{
									continueParse = false;
								} else {
									b_messageLength = new byte[BYTES_MESSAGE_LENGTH];
									Array.ConstrainedCopy (networkConnection.connectionBuffer.Read(MIN_MESSAGE_LENGTH, true), 
										INDEX_MESSAGE_LENGTH, b_messageLength, 0, BYTES_MESSAGE_LENGTH);
								//Console.WriteLine("---------- b_messageLength while..: {0} (first bytes of data buffer)", bytesToString(b_messageLength));
									int.TryParse (bytesToString (b_messageLength), out i_messageLength);
								}
							}
						}
					}

					BeginInvokeOnMainThread (delegate { 
						lblScannerType.Text = _scannerScreen.scannerScreen_Model;
						ivScannerBars.Image = UIImage.FromBundle("Images/" + getSignalBars(_scannerScreen.scannerScreen_Signal));
						lblScannerDisplay1.Text = _scannerScreen.scannerScreen_Line1;
						lblScannerDisplay2.Text = _scannerScreen.scannerScreen_Line2;
						lblScannerDisplay3.Text = _scannerScreen.scannerScreen_Line3;
						lblScannerDisplay4.Text = _scannerScreen.scannerScreen_Line4;
						lblScannerDisplay5.Text = _scannerScreen.scannerScreen_Line5;
						lblBytes.Text = bytesCountToString(networkConnection.bytesReceived);

						lblRecording.Text = (_recordAudio == true ? "Recording" : string.Empty);

						lblServerHostname.Text = optionScreen.ServerHostName;
						lblServerLocation.Text = optionScreen.getLocationFromHost(optionScreen.ServerHostName);

						TimeSpan t = DateTime.Now - _startTime;
						lblTime.Text = string.Format("{0:D2}h{1:D2}m{2:D2}s", 
							t.Hours, 
							t.Minutes, 
							t.Seconds);

						lblMpegLayer.Text = _scannerAudio.scannerAudio_Mpeg;
						lblMpegFrequency.Text = _scannerAudio.scannerAudio_Freq;
						lblMpegRate.Text = _scannerAudio.scannerAudio_Rate;

						if (_scannerAudio.scannerAudio_Buffering)
						{
							notificationView.SetTextLabel ("Buffering...", false);
							notificationView.Show (animated: true);
						} else {
							if (!notificationView.Hidden)
								notificationView.Hide (animated: true);
						}
					});
				}
			} catch (Exception ex) {
				//messageBoxShow ("ProScanMobile+", ex.Message);
				Console.WriteLine (ex.Message);
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

		private string bytesCountToString(long byteCount)
		{
			string[] suf = { "B", "KB", "MB", "GB", "TB", "PB", "EB" };
			if (byteCount == 0)
				return "0" + suf[0];
			long bytes = Math.Abs(byteCount);
			int place = Convert.ToInt32(Math.Floor(Math.Log(bytes, 1024)));
			double num = Math.Round(bytes / Math.Pow(1024, place), 1);
			return string.Format("{0:#0.0}", (Math.Sign(byteCount) * num)) + suf[place];
		}

		private string bytesToString(byte[] b)
		{
			// Return a string encoded byte array
			return System.Text.Encoding.ASCII.GetString (b);
		}

		private string getSignalBars(int signal)
		{
			if (signal >= 0 && signal < 150)
				return "signal_0";
			if (signal >= 150 && signal < 225)
				return "signal_1";
			if (signal >= 225 && signal < 250)
				return "signal_2";
			if (signal >= 250 && signal < 300)
				return "signal_3";
			if (signal >= 300 && signal < 350)
				return "signal_4";
			if (signal >= 350)
				return "signal_5";

			return "signal_0";
		}
	}
}

