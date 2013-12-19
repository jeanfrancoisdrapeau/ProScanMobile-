using System;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.AVFoundation;
using System.Drawing;
using System.IO;

namespace ProScanMobile
{
	public class CustomRecCell: UITableViewCell  {

		private AVAudioPlayer _audioPlayer;
		public AVAudioPlayer audioPlayer { get { return _audioPlayer; } }

		private UILabel fileNameLabel;
		private UIButton playerPlayButton;
		private UIButton playerStopButton;
		private UISlider progressBar;

		NSTimer updateTimer;

		public CustomRecCell (NSString cellId) : base (UITableViewCellStyle.Default, cellId)
		{
			SelectionStyle = UITableViewCellSelectionStyle.Gray;

			fileNameLabel = new UILabel () {
				Font = UIFont.FromName("AmericanTypewriter", 15f),
				BackgroundColor = UIColor.Clear
			};

			playerPlayButton = new UIButton ();
			playerPlayButton.SetTitle("Play", UIControlState.Normal);
			playerPlayButton.SetTitle("Playing", UIControlState.Selected);
			playerPlayButton.Font = UIFont.FromName ("AmericanTypewriter", 15f);
			playerPlayButton.TouchUpInside += playerPlayButtonTouchUpInside_Event;

			playerStopButton = new UIButton ();
			playerStopButton.SetTitle("Stop", UIControlState.Normal);
			playerStopButton.Font = UIFont.FromName ("AmericanTypewriter", 15f);
			playerStopButton.TouchUpInside += playerStopButtonTouchUpInside_Event;

			progressBar = new UISlider ();
			progressBar.SetThumbImage (UIImage.FromBundle("Images/slider_thumb"), UIControlState.Normal);

			ContentView.Add (fileNameLabel);
			ContentView.Add (playerPlayButton);
			ContentView.Add (playerStopButton);
			ContentView.Add (progressBar);
		}

		/// <summary>
		/// Updates the cell.
		/// </summary>
		/// <description>
		/// </description>
		/// <param name="fileName">File name.</param>
		public void UpdateCell (string fileName)
		{
			fileNameLabel.Text = fileName;
		}

		public override void LayoutSubviews ()
		{
			base.LayoutSubviews ();

			fileNameLabel.Frame = new RectangleF(5, 5, ContentView.Bounds.Width, 20);
			playerPlayButton.Frame = new RectangleF(0, 25, 80, 20);
			playerStopButton.Frame = new RectangleF(80, 25, 50, 20);
			progressBar.Frame = new RectangleF(135, 28, 150, 13);
		}

		private void playerPlayButtonTouchUpInside_Event(object sender, EventArgs e)
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var fileName = Path.Combine (documents, fileNameLabel.Text);

			_audioPlayer = AVAudioPlayer.FromUrl(NSUrl.FromFilename(fileName));
			if (_audioPlayer != null) {
				_audioPlayer.FinishedPlaying += audioPlayerFinishedPlaying_Event;
				_audioPlayer.PrepareToPlay ();
				_audioPlayer.Play ();

				progressBar.MinValue = 0.0f;
				progressBar.Value = 0.0f;
				progressBar.MaxValue = (float)_audioPlayer.Duration;

				updateTimer = NSTimer.CreateRepeatingScheduledTimer (TimeSpan.FromSeconds (0.01), delegate {
					progressBar.Value = (float) _audioPlayer.CurrentTime;
				});

				playerPlayButton.Selected = true;
			}
		}

		private void audioPlayerFinishedPlaying_Event(object sender, EventArgs e)
		{
			clearPlayer ();
		}

		public void CellChanged()
		{
			clearPlayer ();
		}

		private void playerStopButtonTouchUpInside_Event(object sender, EventArgs e)
		{
			clearPlayer ();
		}

		private void clearPlayer()
		{
			if (_audioPlayer != null) {
				if (_audioPlayer.Playing) {
					_audioPlayer.Stop ();
				}
			}

			if (updateTimer != null)
				updateTimer.Invalidate ();
			updateTimer = null;

			progressBar.Value = 0.0f;

			playerPlayButton.Selected = false;
		}
	}
}

