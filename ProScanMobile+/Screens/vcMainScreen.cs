using System;
using System.Drawing;
using System.Collections.Generic;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile
{
	public partial class vcMainScreen : UIViewController
	{
		UIScrollView _scrollView;
		UIPageControl _pageControl;
		List<UIButton> _buttons;

		public vcMainScreen () : base ("vcMainScreen", null)
		{
			_buttons = new List<UIButton> ();
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			initInterface ();
		}

		private void initInterface()
		{
			// Scanner display
			UIImageView ivScannerDisplay = new UIImageView {
				Frame = new RectangleF (5, 73, 310, 249),
				Image = UIImage.FromBundle("Images/scanner_display.jpg")
			};

			// Play button
			UIButton btnPlay = new UIButton {
				Frame = new RectangleF(5, 0, 40, 40)
			};
			btnPlay.Layer.CornerRadius = 9.5f;
			btnPlay.Layer.MasksToBounds = true;
			btnPlay.ClipsToBounds = true;
			btnPlay.SetImage(UIImage.FromBundle("Images/green_button.jpg"), UIControlState.Normal);
			btnPlay.TouchUpInside += btnPlayTouchUpInside_Event;

			// Stop button
			UIButton btnStop = new UIButton {
				Frame = new RectangleF(50, 0, 40, 40)
			};
			btnStop.Layer.CornerRadius = 9.5f;
			btnStop.Layer.MasksToBounds = true;
			btnStop.ClipsToBounds = true;
			btnStop.SetImage(UIImage.FromBundle("Images/red_button.jpg"), UIControlState.Normal);
			btnStop.TouchUpInside += btnStopTouchUpInside_Event;

			// Options button
			UIButton btnOptions = new UIButton {
				Frame = new RectangleF(View.Frame.Width - 45, 0, 40, 40)
			};
			btnOptions.Layer.CornerRadius = 9.5f;
			btnOptions.Layer.MasksToBounds = true;
			btnOptions.ClipsToBounds = true;
			btnOptions.SetImage(UIImage.FromBundle("Images/config_button.jpg"), UIControlState.Normal);
			btnOptions.TouchUpInside += btnOptionsTouchUpInside_Event;

			// Scanner buttons
			UIButton btnScanner_Func = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 20, 0, 55, 25)
			};
			btnScanner_Func.Tag = 1; //"btnScanner_Func"
			btnScanner_Func.Layer.CornerRadius = 11.0f;
			btnScanner_Func.Layer.MasksToBounds = true;
			btnScanner_Func.ClipsToBounds = true;
			btnScanner_Func.SetImage(UIImage.FromBundle("Images/scanner_button_func.jpg"), UIControlState.Normal);
			btnScanner_Func.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_1 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 75, 0, 55, 25)
			};
			btnScanner_1.Tag = 2; //"btnScanner_1"
			btnScanner_1.Layer.CornerRadius = 11.0f;
			btnScanner_1.Layer.MasksToBounds = true;
			btnScanner_1.ClipsToBounds = true;
			btnScanner_1.SetImage(UIImage.FromBundle("Images/scanner_button_1.jpg"), UIControlState.Normal);
			btnScanner_1.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_2 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 130, 0, 55, 25)
			};
			btnScanner_2.Tag = 3; //"btnScanner_2"
			btnScanner_2.Layer.CornerRadius = 11.0f;
			btnScanner_2.Layer.MasksToBounds = true;
			btnScanner_2.ClipsToBounds = true;
			btnScanner_2.SetImage(UIImage.FromBundle("Images/scanner_button_2.jpg"), UIControlState.Normal);
			btnScanner_2.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_3 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 185, 0, 55, 25)
			};
			btnScanner_3.Tag = 4; //"btnScanner_3"
			btnScanner_3.Layer.CornerRadius = 11.0f;
			btnScanner_3.Layer.MasksToBounds = true;
			btnScanner_3.ClipsToBounds = true;
			btnScanner_3.SetImage(UIImage.FromBundle("Images/scanner_button_3.jpg"), UIControlState.Normal);
			btnScanner_3.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Scan = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 240, 0, 55, 25)
			};
			btnScanner_Scan.Tag = 5; //"btnScanner_Scan"
			btnScanner_Scan.Layer.CornerRadius = 11.0f;
			btnScanner_Scan.Layer.MasksToBounds = true;
			btnScanner_Scan.ClipsToBounds = true;
			btnScanner_Scan.SetImage(UIImage.FromBundle("Images/scanner_button_scan.jpg"), UIControlState.Normal);
			btnScanner_Scan.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Menu = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 20, 25, 55, 25)
			};
			btnScanner_Menu.Tag = 6; //"btnScanner_Menu"
			btnScanner_Menu.Layer.CornerRadius = 11.0f;
			btnScanner_Menu.Layer.MasksToBounds = true;
			btnScanner_Menu.ClipsToBounds = true;
			btnScanner_Menu.SetImage(UIImage.FromBundle("Images/scanner_button_menu.jpg"), UIControlState.Normal);
			btnScanner_Menu.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_4 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 75, 25, 55, 25)
			};
			btnScanner_4.Tag = 7; //"btnScanner_4"
			btnScanner_4.Layer.CornerRadius = 11.0f;
			btnScanner_4.Layer.MasksToBounds = true;
			btnScanner_4.ClipsToBounds = true;
			btnScanner_4.SetImage(UIImage.FromBundle("Images/scanner_button_4.jpg"), UIControlState.Normal);
			btnScanner_4.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_5 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 130, 25, 55, 25)
			};
			btnScanner_5.Tag = 8; //"btnScanner_5"
			btnScanner_5.Layer.CornerRadius = 11.0f;
			btnScanner_5.Layer.MasksToBounds = true;
			btnScanner_5.ClipsToBounds = true;
			btnScanner_5.SetImage(UIImage.FromBundle("Images/scanner_button_5.jpg"), UIControlState.Normal);
			btnScanner_5.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_6 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 185, 25, 55, 25)
			};
			btnScanner_6.Tag = 9; //"btnScanner_6"
			btnScanner_6.Layer.CornerRadius = 11.0f;
			btnScanner_6.Layer.MasksToBounds = true;
			btnScanner_6.ClipsToBounds = true;
			btnScanner_6.SetImage(UIImage.FromBundle("Images/scanner_button_6.jpg"), UIControlState.Normal);
			btnScanner_6.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Hold = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 240, 25, 55, 25)
			};
			btnScanner_Hold.Tag = 10; //"btnScanner_Hold"
			btnScanner_Hold.Layer.CornerRadius = 11.0f;
			btnScanner_Hold.Layer.MasksToBounds = true;
			btnScanner_Hold.ClipsToBounds = true;
			btnScanner_Hold.SetImage(UIImage.FromBundle("Images/scanner_button_hold.jpg"), UIControlState.Normal);
			btnScanner_Hold.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_LO = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 20, 50, 55, 25)
			};
			btnScanner_LO.Tag = 11; //"btnScanner_LO"
			btnScanner_LO.Layer.CornerRadius = 11.0f;
			btnScanner_LO.Layer.MasksToBounds = true;
			btnScanner_LO.ClipsToBounds = true;
			btnScanner_LO.SetImage(UIImage.FromBundle("Images/scanner_button_lockout.jpg"), UIControlState.Normal);
			btnScanner_LO.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_7 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 75, 50, 55, 25)
			};
			btnScanner_7.Tag = 12; //"btnScanner_7"
			btnScanner_7.Layer.CornerRadius = 11.0f;
			btnScanner_7.Layer.MasksToBounds = true;
			btnScanner_7.ClipsToBounds = true;
			btnScanner_7.SetImage(UIImage.FromBundle("Images/scanner_button_7.jpg"), UIControlState.Normal);
			btnScanner_7.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_8 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 130, 50, 55, 25)
			};
			btnScanner_8.Tag = 13; //"btnScanner_8"
			btnScanner_8.Layer.CornerRadius = 11.0f;
			btnScanner_8.Layer.MasksToBounds = true;
			btnScanner_8.ClipsToBounds = true;
			btnScanner_8.SetImage(UIImage.FromBundle("Images/scanner_button_8.jpg"), UIControlState.Normal);
			btnScanner_8.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_9 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 185, 50, 55, 25)
			};
			btnScanner_9.Tag = 14; //"btnScanner_9"
			btnScanner_9.Layer.CornerRadius = 11.0f;
			btnScanner_9.Layer.MasksToBounds = true;
			btnScanner_9.ClipsToBounds = true;
			btnScanner_9.SetImage(UIImage.FromBundle("Images/scanner_button_9.jpg"), UIControlState.Normal);
			btnScanner_9.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Left = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 20, 75, 55, 25)
			};
			btnScanner_Left.Tag = 15; //"btnScanner_Left"
			btnScanner_Left.Layer.CornerRadius = 11.0f;
			btnScanner_Left.Layer.MasksToBounds = true;
			btnScanner_Left.ClipsToBounds = true;
			btnScanner_Left.SetImage(UIImage.FromBundle("Images/scanner_button_left.jpg"), UIControlState.Normal);
			btnScanner_Left.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_No = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 75, 75, 55, 25)
			};
			btnScanner_No.Tag = 16; //"btnScanner_No"
			btnScanner_No.Layer.CornerRadius = 11.0f;
			btnScanner_No.Layer.MasksToBounds = true;
			btnScanner_No.ClipsToBounds = true;
			btnScanner_No.SetImage(UIImage.FromBundle("Images/scanner_button_no.jpg"), UIControlState.Normal);
			btnScanner_No.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_0 = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 130, 75, 55, 25)
			};
			btnScanner_0.Tag = 17; //"btnScanner_0"
			btnScanner_0.Layer.CornerRadius = 11.0f;
			btnScanner_0.Layer.MasksToBounds = true;
			btnScanner_0.ClipsToBounds = true;
			btnScanner_0.SetImage(UIImage.FromBundle("Images/scanner_button_0.jpg"), UIControlState.Normal);
			btnScanner_0.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Eyes = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 185, 75, 55, 25)
			};
			btnScanner_Eyes.Tag = 18; //"btnScanner_Eyes"
			btnScanner_Eyes.Layer.CornerRadius = 11.0f;
			btnScanner_Eyes.Layer.MasksToBounds = true;
			btnScanner_Eyes.ClipsToBounds = true;
			btnScanner_Eyes.SetImage(UIImage.FromBundle("Images/scanner_button_eyes.jpg"), UIControlState.Normal);
			btnScanner_Eyes.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Right = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 240, 75, 55, 25)
			};
			btnScanner_Right.Tag = 19; //"btnScanner_Right"
			btnScanner_Right.Layer.CornerRadius = 11.0f;
			btnScanner_Right.Layer.MasksToBounds = true;
			btnScanner_Right.ClipsToBounds = true;
			btnScanner_Right.SetImage(UIImage.FromBundle("Images/scanner_button_right.jpg"), UIControlState.Normal);
			btnScanner_Right.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_FuncH = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 20, 100, 55, 25)
			};
			btnScanner_FuncH.Tag = 20; //"btnScanner_FuncH"
			btnScanner_FuncH.Layer.CornerRadius = 11.0f;
			btnScanner_FuncH.Layer.MasksToBounds = true;
			btnScanner_FuncH.ClipsToBounds = true;
			btnScanner_FuncH.SetImage(UIImage.FromBundle("Images/scanner_button_funch.jpg"), UIControlState.Normal);
			btnScanner_FuncH.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_FuncR = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 75, 100, 55, 25)
			};
			btnScanner_FuncR.Tag = 21; //"btnScanner_FuncR"
			btnScanner_FuncR.Layer.CornerRadius = 11.0f;
			btnScanner_FuncR.Layer.MasksToBounds = true;
			btnScanner_FuncR.ClipsToBounds = true;
			btnScanner_FuncR.SetImage(UIImage.FromBundle("Images/scanner_button_funcr.jpg"), UIControlState.Normal);
			btnScanner_FuncR.TouchUpInside += btnScannerTouchUpInside_Event;

			UIButton btnScanner_Push = new UIButton {
				Frame = new RectangleF(View.Frame.Width + 130, 100, 55, 25)
			};
			btnScanner_Push.Tag = 22; //"btnScanner_Push"
			btnScanner_Push.Layer.CornerRadius = 11.0f;
			btnScanner_Push.Layer.MasksToBounds = true;
			btnScanner_Push.ClipsToBounds = true;
			btnScanner_Push.SetImage(UIImage.FromBundle("Images/scanner_button_push.jpg"), UIControlState.Normal);
			btnScanner_Push.TouchUpInside += btnScannerTouchUpInside_Event;

			// Scrollview for Play, Stop, Options and Scanner controls
			_scrollView = new UIScrollView {
				Frame = new RectangleF (0, 325, View.Frame.Width,
					125),
				ContentSize = new SizeF (View.Frame.Width * 2, 125),
				BackgroundColor = UIColor.White,
				AutoresizingMask = UIViewAutoresizing.FlexibleWidth,
				PagingEnabled = true,
				ShowsHorizontalScrollIndicator = false
			};

			_scrollView.AddSubviews (new UIView[] { btnPlay, 
				btnStop, 
				btnOptions });

			_scrollView.AddSubviews (new UIView[] { btnScanner_Func, btnScanner_1, btnScanner_2, btnScanner_3, btnScanner_Scan,
				btnScanner_Menu, btnScanner_4, btnScanner_5, btnScanner_6, btnScanner_Hold, 
				btnScanner_LO, btnScanner_7, btnScanner_8, btnScanner_9, 
				btnScanner_Left, btnScanner_No, btnScanner_0, btnScanner_Eyes, btnScanner_Right,
				btnScanner_FuncH, btnScanner_FuncR, btnScanner_Push
			 });

			// Dot indicator for _scrollView
			_pageControl = new UIPageControl {
				Frame = new RectangleF ((View.Frame.Width / 2) - 25, 
					_scrollView.Frame.Y + _scrollView.Frame.Height, 
					50, 15),
				PageIndicatorTintColor = UIColor.LightGray,
				CurrentPageIndicatorTintColor = UIColor.Blue
			};
			_pageControl.Pages = 2;
			_pageControl.ValueChanged += pageControlValueChanged_Event;

			_scrollView.Scrolled += scrollViewScrolled_Event;

			// Add everything to current view
			View.AddSubviews (new UIView[] { ivScannerDisplay, 
				_scrollView, 
				_pageControl});
		}

		private void btnScannerTouchUpInside_Event(object sender, EventArgs e)
		{
			UIButton btn = (UIButton)sender;

			switch((int)btn.Tag) {
			case 1: //"btnScanner_Func":
				break;
			case 2: //"btnScanner_1":
				break;
			case 3: //"btnScanner_2":
				break;
			case 4: //"btnScanner_3":
				break;
			case 5: //"btnScanner_Scan":
				break;
			case 6: //"btnScanner_Menu":
				break;
			case 7: //"btnScanner_4":
				break; 
			case 8: //"btnScanner_5":
				break;
			case 9: //"btnScanner_6":
				break;
			case 10: //"btnScanner_Hold":
				break;
			case 11: //"btnScanner_LO":
				break;
			case 12: //"btnScanner_7":
				break;
			case 13: //"btnScanner_8":
				break;
			case 14: //"btnScanner_9,":
				break;
			case 15: //"btnScanner_Left":
				break;
			case 16: //"btnScanner_No":
				break;
			case 17: //"btnScanner_0":
				break;
			case 18: //"btnScanner_Eyes":
				break;
			case 19: //"btnScanner_Right":
				break;
			case 20: //"btnScanner_FuncH":
				break;
			case 21: //"btnScanner_FuncR":
				break;
			case 22: //"btnScanner_Push":
				break;
			}
		}

		private void scrollViewScrolled_Event(object sender, EventArgs e)
		{
			_pageControl.CurrentPage = 
				(int)System.Math.Floor(_scrollView.ContentOffset.X 
					/ this._scrollView.Frame.Size.Width);
		}

		private void pageControlValueChanged_Event(object sender, EventArgs e)
		{
			UIPageControl pager = sender as UIPageControl;
			int page = pager.CurrentPage;
			RectangleF frame = _scrollView.Frame;
			frame.X = frame.Width * page;
			_scrollView.ScrollRectToVisible (frame, true);
		}

		private void btnPlayTouchUpInside_Event(object sender, EventArgs e)
		{
		}

		private void btnStopTouchUpInside_Event(object sender, EventArgs e)
		{
		}

		private void btnOptionsTouchUpInside_Event(object sender, EventArgs e)
		{
		}
	}
}

