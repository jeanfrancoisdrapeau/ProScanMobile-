using System;
using System.Drawing;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile
{
	public partial class vcAlertsScreen : UIViewController
	{
		UISwitch _swAlertMode;
		UITableView _tvLogs;
		UIRefreshControl _rcRefreshControl;

		[Serializable]
		[XmlRoot("Settings")]
		public class Settings
		{
			[XmlArray("Settings"), XmlArrayItem(typeof(SettingsDetails), ElementName = "SettingsDetails")]
			public List<SettingsDetails> SettingsList { get; set; }
		}

		[Serializable]
		public class SettingsDetails
		{
			public bool alert { get; set; }
		}

		private Settings si;

		public vcAlertsScreen () : base ("vcAlertsScreen", null)
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
			ScannerLog.GetLogs ();
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			doRefreshLogs ();
			UpdateSettings ();
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
			ScannerLog.SaveLogs ();
			SaveSettings ();
		}

		private void initInterface()
		{
			UILabel lblAlertMode = new UILabel {
				Frame = new RectangleF (5, 32, 100, 17)
			};
			lblAlertMode.TextAlignment = UITextAlignment.Right;
			lblAlertMode.Text = "Alert mode";

			_swAlertMode = new UISwitch {
				Frame = new RectangleF (150, 25, 49, 31)
			};

			_tvLogs = new UITableView {
				Frame = new RectangleF (0, 60, UIScreen.MainScreen.Bounds.Width, 
					UIScreen.MainScreen.Bounds.Height - 160)
			};

			_rcRefreshControl = new UIRefreshControl();
			_rcRefreshControl.ValueChanged += (sender, e) => { doRefreshLogs(); };
			_tvLogs.AddSubview (_rcRefreshControl);

			View.AddSubviews (new UIView[] { lblAlertMode, _swAlertMode,
				_tvLogs
			});
		}

		private void doRefreshLogs()
		{
			_tvLogs.RowHeight = 20.0f;
			_tvLogs.AllowsMultipleSelection = false;
			_tvLogs.Source = new AlertTableSource (ScannerLog.log.LogsList);
			_tvLogs.ReloadData ();

			_rcRefreshControl.EndRefreshing ();
		}

		private void SaveSettings()
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);

			si = new Settings ();
			si.SettingsList = new List<SettingsDetails> ();
			SettingsDetails sid = new SettingsDetails ();
			var filename = Path.Combine (documents, "proscanmobile_settings_alert.xml");

			sid.alert = _swAlertMode.On;

			si.SettingsList.Add (sid);

			XmlSerializer serializer = new XmlSerializer (typeof(Settings));
			TextWriter textWriter = new StreamWriter (filename);
			serializer.Serialize (textWriter, si);
			textWriter.Close ();
		}

		public void GetSettings()
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var filename = Path.Combine (documents, "proscanmobile_settings_alert.xml");

			if (File.Exists (filename)) {

				stripIllegalXMLChars (filename);

				XmlSerializer deserializer = new XmlSerializer (typeof(Settings));
				TextReader textReader = new StreamReader (filename);
				si = (Settings)deserializer.Deserialize (textReader);
				textReader.Close ();
			}
		}

		private void UpdateSettings ()
		{
			GetSettings ();

			if (si != null) {
				_swAlertMode.On = si.SettingsList [0].alert;
			}
		}

		private void stripIllegalXMLChars(string filePath)
		{
			//Remove illegal character sequences
			string tmpContents = File.ReadAllText(filePath, Encoding.UTF8);

			string pattern = @"#x((10?|[2-F])FFF[EF]|FDD[0-9A-F]|[19][0-9A-F]|7F|8[0-46-9A-F]|0?[1-8BCEF])";

			Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);
			if (regex.IsMatch(tmpContents)) {
				tmpContents = regex.Replace(tmpContents, String.Empty);
				File.WriteAllText(filePath, tmpContents, Encoding.UTF8);
			}
			tmpContents = string.Empty;
		}
	}
}

