using System;
using System.Drawing;
using System.Threading;
using System.Net;
using System.IO;
using System.Xml.Serialization;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using System.Collections.Generic;
using GCDiscreetNotification;

namespace ProScanMobile
{
	public partial class vcOptionsScreen : UIViewController
	{
		GCDiscreetNotificationView notificationView;

		UITextField _txtServerHost;
		UITextField _txtServerPort;
		UITextField _txtServerPassword;
		UISwitch _swAutoConnect;
		UITableView _tvServers;

		public static MonoTouch.UIKit.UITextField txtSH;
		public static MonoTouch.UIKit.UITextField txtSP;
		public static MonoTouch.UIKit.UITextField txtPW;

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
			public string host { get; set; }
			public int port { get; set; }
			public bool auto { get; set; }
			public string pass { get; set; }
		}

		[Serializable]
		[XmlRoot("Servers")]
		public class Servers
		{
			[XmlArray("ServersList"), XmlArrayItem(typeof(ServerDetails), ElementName = "ServerDetails")]
			public List<ServerDetails> ServerList { get; set; }
		}

		[Serializable]
		public class ServerDetails
		{
			public string open { get; set; }
			public string host { get; set; }
			public string port { get; set; }
			public string desc { get; set; }
			public string country { get; set; }
			public string state { get; set; }
			public string county { get; set; }
		}

		private Settings si;
		private Servers s;
		private List<TableItem> tableItems;

		private Encryption enc;

		public string ServerHostName { get { return (si.SettingsList [0] == null ? string.Empty : si.SettingsList [0].host); } }
		public int ServerHostPort { get { return (si.SettingsList [0] == null ? 0 : si.SettingsList [0].port); } }
		public bool ServerAutoConnect { get { return (si.SettingsList [0] == null ? false : si.SettingsList [0].auto); } }
		public string ServerPassWord { get { return (txtPW == null ? string.Empty : enc.Encrypt(txtPW.Text.Trim())); } }

		public vcOptionsScreen () : base ("vcOptionsScreen", null)
		{
			Title = "Options and Servers";
			enc = new Encryption ();
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

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			UpdateSettings ();
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
			SaveSettings ();
		}

		private void initInterface()
		{
			_txtServerHost = new UITextField {
				Frame = new RectangleF (20, 72, 280, 25)
			};
			_txtServerHost.Placeholder = "Server hostname";
			_txtServerHost.BorderStyle = UITextBorderStyle.RoundedRect;
			_txtServerHost.KeyboardType = UIKeyboardType.Url;
			_txtServerHost.AutocapitalizationType = UITextAutocapitalizationType.None;
			_txtServerHost.AutocorrectionType = UITextAutocorrectionType.No;
			_txtServerHost.ShouldReturn += (textField) => { 
				textField.ResignFirstResponder();
				return true; 
			};

			_txtServerPort = new UITextField {
				Frame = new RectangleF (20, 98, 65, 25)
			};
			_txtServerPort.Placeholder = "Port";
			_txtServerPort.BorderStyle = UITextBorderStyle.RoundedRect;
			_txtServerPort.KeyboardType = UIKeyboardType.NumberPad;
			_txtServerPort.AutocapitalizationType = UITextAutocapitalizationType.None;
			_txtServerPort.AutocorrectionType = UITextAutocorrectionType.No;
			_txtServerPort.ShouldReturn += (textField) => { 
				textField.ResignFirstResponder();
				return true; 
			};

			_txtServerPassword = new UITextField {
				Frame = new RectangleF (85, 98, 215, 25)
			};
			_txtServerPassword.Placeholder = "Password (optional)";
			_txtServerPassword.BorderStyle = UITextBorderStyle.RoundedRect;
			_txtServerPassword.KeyboardType = UIKeyboardType.Default;
			_txtServerPassword.AutocapitalizationType = UITextAutocapitalizationType.None;
			_txtServerPassword.AutocorrectionType = UITextAutocorrectionType.No;
			_txtServerPassword.SecureTextEntry = true;
			_txtServerPassword.ShouldReturn += (textField) => { 
				textField.ResignFirstResponder();
				return true; 
			};

			UILabel lblAutoConnect = new UILabel {
				Frame = new RectangleF (5, 130, 200, 17)
			};
			lblAutoConnect.TextAlignment = UITextAlignment.Right;
			lblAutoConnect.Text = "Auto-connect at startup";

			_swAutoConnect = new UISwitch {
				Frame = new RectangleF (250, 123, 49, 31)
			};

			_tvServers = new UITableView {
				Frame = new RectangleF (0, 155, UIScreen.MainScreen.Bounds.Width, UIScreen.MainScreen.Bounds.Height - 185)
			};

			UIButton btnRefresh = new UIButton {
				Frame = new RectangleF(261, UIScreen.MainScreen.Bounds.Height - 30, 55, 25)
			};
			btnRefresh.Layer.CornerRadius = 11.0f;
			btnRefresh.Layer.MasksToBounds = true;
			btnRefresh.ClipsToBounds = true;
			btnRefresh.SetImage(UIImage.FromBundle("Images/refresh_servers_button.jpg"), UIControlState.Normal);
			btnRefresh.TouchUpInside += btnRefreshTouchUpInside_Event;

			View.AddSubviews (new UIView[] { _txtServerHost, _txtServerPort, _txtServerPassword,
				lblAutoConnect, _swAutoConnect,
				_tvServers, btnRefresh
			});

			txtSH = _txtServerHost;
			txtSP = _txtServerPort;
			txtPW = _txtServerPassword;
		}

		private void btnRefreshTouchUpInside_Event (object sender, EventArgs e)
		{
			doRefreshServers();
		}

		private void doRefreshServers()
		{
			_tvServers.AllowsSelection = false;

			notificationView = new GCDiscreetNotificationView (
				text: "Refreshing servers...",
				activity: true,
				presentationMode: GCDNPresentationMode.Bottom,
				view: View
			);

			notificationView.Show (animated: false);

			// Connect to proscan.org server and fetch listed servers
			try{
				WebClient wc = new WebClient();
				wc.DownloadStringCompleted += new DownloadStringCompletedEventHandler(DownloadStringCallback);
				wc.DownloadStringAsync(new Uri("http://www.proscan.org/SOIP/SOIP.php?action=getservers")); 

			} catch {
				MessageBoxShow("ProScanMobile", "Unable to fetch servers from database.");
			} 
		}

		private void DownloadStringCallback(object sender, DownloadStringCompletedEventArgs e)
		{
			try
			{
				StringReader reader = new StringReader (e.Result);
				string line;

				s = new Servers();
				s.ServerList = new List<ServerDetails>();

				do {
					line = reader.ReadLine ();

					if (line != null) {
						string[] str = line.Split (',');
						ServerDetails sd = new ServerDetails ();
						sd.host = str [0].Substring (3);
						sd.port = str [1].Substring (5);
						sd.desc = str [2].Substring (5);
						sd.country = str [13];
						sd.state = str [14];
						sd.county = str [15];
						sd.open = str [7].Substring (6);
						s.ServerList.Add (sd);
					}
				} while (line != null);

				// Add list to the table view
				tableItems = new List<TableItem> ();

				s.ServerList.Sort ((x, y) => x.desc.CompareTo (y.desc));

				foreach (ServerDetails sd in s.ServerList) {
					tableItems.Add (new TableItem (sd.host) { 
						Image = sd.open == "ON" ? UIImage.FromBundle("state_on") : UIImage.FromBundle("state_off"),
						Port = sd.port, 
						Description = sd.desc.Length == 0 ? " " : sd.desc,
						Country = sd.country,
						State = sd.state,
						County = sd.county 
					});
				}

				BeginInvokeOnMainThread (delegate {
					_tvServers.Source = new TableSource (tableItems);
				});
				BeginInvokeOnMainThread (delegate {
					_tvServers.ReloadData ();
				});
			}
			catch {
				MessageBoxShow("ProScanMobile", "Unable to fetch servers from database.");
			}

			BeginInvokeOnMainThread (delegate {
				_tvServers.AllowsSelection = true;
			});
			BeginInvokeOnMainThread (delegate {notificationView.Hide (animated: true); });
		}

		private void SaveSettings()
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var filename = Path.Combine (documents, "proscanmobile_servers.xml");

			XmlSerializer serializer = new XmlSerializer (typeof(Servers));
			TextWriter textWriter = new StreamWriter (filename);
			serializer.Serialize (textWriter, s);
			textWriter.Close ();

			si = new Settings ();
			si.SettingsList = new List<SettingsDetails> ();
			SettingsDetails sid = new SettingsDetails ();
			filename = Path.Combine (documents, "proscanmobile_settings.xml");
			sid.host = _txtServerHost.Text;

			int port;
			int.TryParse (_txtServerPort.Text, out port);

			sid.port = port;
			sid.auto = _swAutoConnect.On;
			sid.pass = (txtPW == null ? string.Empty : enc.Encrypt(txtPW.Text.Trim()));
			si.SettingsList.Add (sid);

			serializer = new XmlSerializer (typeof(Settings));
			textWriter = new StreamWriter (filename);
			serializer.Serialize (textWriter, si);
			textWriter.Close ();
		}

		public void GetSettings()
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var filename = Path.Combine (documents, "proscanmobile_servers.xml");

			if (File.Exists (filename)) {

				XmlSerializer deserializer = new XmlSerializer (typeof(Servers));
				TextReader textReader = new StreamReader (filename);
				s = (Servers)deserializer.Deserialize (textReader);
				textReader.Close ();
			}

			filename = Path.Combine (documents, "proscanmobile_settings.xml");

			if (File.Exists (filename)) {
				XmlSerializer deserializer = new XmlSerializer (typeof(Settings));
				TextReader textReader = new StreamReader (filename);
				si = (Settings)deserializer.Deserialize (textReader);
				textReader.Close ();
			}
		}

		private void UpdateSettings ()
		{
			GetSettings ();

			if (s != null) {
				List<TableItem> tableItems = new List<TableItem> ();

				foreach (ServerDetails sd in s.ServerList) {
					tableItems.Add (new TableItem (sd.host) { 
						Image = sd.open == "ON" ? UIImage.FromBundle("/Images/state_on") : UIImage.FromBundle("/Images/state_off"),
						Port = sd.port, 
						Description = sd.desc.Length == 0 ? " " : sd.desc,
						Country = sd.country,
						State = sd.state,
						County = sd.county });
				}

				_tvServers.Source = new TableSource (tableItems);

				_tvServers.ReloadData ();
			}

			if (si != null) {
				_txtServerHost.Text = si.SettingsList[0].host;
				_txtServerPort.Text = si.SettingsList[0].port.ToString();
				_txtServerPassword.Text = (si.SettingsList [0].pass == null ? string.Empty : 
					enc.Decrypt (si.SettingsList [0].pass));
				_swAutoConnect.On = si.SettingsList [0].auto;
			}
		}

		public string getLocationFromHost(string h)
		{
			if (s != null) {
				int index = s.ServerList.FindIndex (r => r.host.Equals (h));

				if (index != -1)
					return string.Format ("{0}, {1}, {2}", s.ServerList [index].county,
						s.ServerList [index].state,
						s.ServerList [index].country);
			}
				
			return string.Empty;
		}

		private void MessageBoxShow(string Title, string Message)
		{
			InvokeOnMainThread (delegate {
				UIAlertView alert = new UIAlertView ();
				alert.Title = Title;
				alert.AddButton ("OK");
				alert.Message = Message;
				alert.Show ();
			});
		}
	}
}

