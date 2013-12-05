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

			ContentView.Add (fileNameLabel);
			ContentView.Add (playerPlayButton);
			ContentView.Add (playerStopButton);
		}

		public void UpdateCell (string fileName)
		{
			fileNameLabel.Text = fileName;
		}

		public void CellChanged()
		{
			if (_audioPlayer != null) {
				if (_audioPlayer.Playing)
					_audioPlayer.Stop ();
			}
			playerPlayButton.Selected = false;
		}

		public override void LayoutSubviews ()
		{
			base.LayoutSubviews ();

			fileNameLabel.Frame = new RectangleF(5, 5, ContentView.Bounds.Width, 20);
			playerPlayButton.Frame = new RectangleF(0, 25, 80, 20);
			playerStopButton.Frame = new RectangleF(80, 25, 50, 20);
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

				playerPlayButton.Selected = true;
			}
		}

		private void audioPlayerFinishedPlaying_Event(object sender, EventArgs e)
		{
			_audioPlayer = null;
			playerPlayButton.Selected = false;
		}

		private void playerStopButtonTouchUpInside_Event(object sender, EventArgs e)
		{
			if (_audioPlayer != null) {
				if (_audioPlayer.Playing)
					_audioPlayer.Stop ();
			}
			playerPlayButton.Selected = false;
		}
	}
}

