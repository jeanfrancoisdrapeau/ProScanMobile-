using System;
using System.Drawing;
using System.Threading;
using System.Net;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using System.Text;
using System.Text.RegularExpressions;
using MonoTouch.Foundation;
using MonoTouch.UIKit;
using System.Collections.Generic;

namespace ProScanMobile
{
	/// <summary>
	/// Class of the Options Screen
	/// </summary>
	public partial class vcOptionsScreen : UIViewController
	{
		UITextField _txtServerHost;
		UITextField _txtServerPort;
		#if PLUS_VERSION
		UITextField _txtServerPassword;
		#endif
		UISwitch _swAutoConnect;
		UITableView _tvServers;
		UIRefreshControl _rcRefreshControl;

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
			public string location { get; set; }
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

		#if PLUS_VERSION
		private Encryption enc;
		#endif

		public vcOptionsScreen () : base ("vcOptionsScreen", null)
		{
			Title = "Options and Servers";
			#if PLUS_VERSION
			enc = new Encryption ();
			#endif
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
				Frame = new RectangleF (20, 23, 280, 25)
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
				Frame = new RectangleF (20, 49, 65, 25)
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

			#if PLUS_VERSION
			_txtServerPassword = new UITextField {
				Frame = new RectangleF (85, 49, 215, 25)
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
			#endif

			UILabel lblAutoConnect = new UILabel {
				Frame = new RectangleF (5, 82, 200, 17)
			};
			lblAutoConnect.TextAlignment = UITextAlignment.Right;
			lblAutoConnect.Text = "Auto-connect at startup";

			_swAutoConnect = new UISwitch {
				Frame = new RectangleF (250, 75, 49, 31)
			};

			_tvServers = new UITableView {
				Frame = new RectangleF (0, 111, UIScreen.MainScreen.Bounds.Width, 
					UIScreen.MainScreen.Bounds.Height - 160)
			};
			 
			_rcRefreshControl = new UIRefreshControl();
			_rcRefreshControl.ValueChanged += (sender, e) => { doRefreshServers(); };
			_tvServers.AddSubview (_rcRefreshControl);

			#if PLUS_VERSION
			View.AddSubviews (new UIView[] { _txtServerHost, _txtServerPort, _txtServerPassword,
				lblAutoConnect, _swAutoConnect,
				_tvServers
			});
			#else
			View.AddSubviews (new UIView[] { _txtServerHost, _txtServerPort,
				lblAutoConnect, _swAutoConnect,
				_tvServers
			});
			#endif

			txtSH = _txtServerHost;
			txtSP = _txtServerPort;
			#if PLUS_VERSION
			txtPW = _txtServerPassword;
			#endif
		}

		private void doRefreshServers()
		{
			_tvServers.AllowsSelection = false;

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
						sd.host = str [0].Substring (3).Trim();
						sd.port = str [1].Substring (5).Trim();
						sd.desc = str [2].Substring (5).Trim();
						sd.country = str [13].Trim();
						sd.state = str [14].Trim();
						sd.county = str [15].Trim();
						sd.open = str [7].Substring (6).Trim();
						s.ServerList.Add (sd);
					}
				} while (line != null);

				// Add list to the table view
				tableItems = new List<TableItem> ();

				s.ServerList.Sort ((x, y) => x.desc.CompareTo (y.desc));

				foreach (ServerDetails sd in s.ServerList) {
					tableItems.Add (new TableItem (sd.host) { 
						Image = sd.open == "ON" ? UIImage.FromBundle("Images/state_on") : UIImage.FromBundle("Images/state_off"),
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
				_rcRefreshControl.EndRefreshing();
			});
		}

		private void SaveSettings()
		{
			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var filename = Path.Combine (documents, "proscanmobile_servers.xml");

			Servers s_tmp = new Servers ();
			s_tmp.ServerList = new List<ServerDetails> ();

			foreach (ServerDetails sd_tmp in s.ServerList) {
				s_tmp.ServerList.Add (new ServerDetails () {
					host = XmlConvert.EncodeName(sd_tmp.host),
					port = XmlConvert.EncodeName(sd_tmp.port),
					desc = XmlConvert.EncodeName(sd_tmp.desc),
					country = XmlConvert.EncodeName(sd_tmp.country),
					state = XmlConvert.EncodeName(sd_tmp.state),
					county = XmlConvert.EncodeName(sd_tmp.county),
					open = XmlConvert.EncodeName(sd_tmp.open)
				});
			}

			XmlSerializer serializer = new XmlSerializer (typeof(Servers));
			TextWriter textWriter = new StreamWriter (filename);
			serializer.Serialize (textWriter, s_tmp);
			textWriter.Close ();

			s_tmp = null;

			si = new Settings ();
			si.SettingsList = new List<SettingsDetails> ();
			SettingsDetails sid = new SettingsDetails ();
			filename = Path.Combine (documents, "proscanmobile_settings.xml");
			sid.host = _txtServerHost.Text;

			int port;
			int.TryParse (_txtServerPort.Text, out port);

			sid.port = port;
			sid.auto = _swAutoConnect.On;
			sid.location = getLocationFromHost (sid.host);
			#if PLUS_VERSION
			sid.pass = enc.Encrypt(_txtServerPassword.Text);
			#else
			sid.pass = string.Empty;
			#endif
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

				stripIllegalXMLChars (filename);

				Servers s_tmp = new Servers ();

				XmlSerializer deserializer = new XmlSerializer (typeof(Servers));
				TextReader textReader = new StreamReader (filename, Encoding.UTF8);
				s_tmp = (Servers)deserializer.Deserialize (textReader);
				textReader.Close ();

				s = new Servers ();
				s.ServerList = new List<ServerDetails> ();

				foreach (ServerDetails sd_tmp in s_tmp.ServerList) {
					s.ServerList.Add (new ServerDetails () {
						host = XmlConvert.DecodeName(sd_tmp.host),
						port = XmlConvert.DecodeName(sd_tmp.port),
						desc = XmlConvert.DecodeName(sd_tmp.desc),
						country = XmlConvert.DecodeName(sd_tmp.country),
						state = XmlConvert.DecodeName(sd_tmp.state),
						county = XmlConvert.DecodeName(sd_tmp.county),
						open = XmlConvert.DecodeName(sd_tmp.open)
					});
				}

				s_tmp = null;
			}

			filename = Path.Combine (documents, "proscanmobile_settings.xml");

			if (File.Exists (filename)) {

				stripIllegalXMLChars (filename);

				XmlSerializer deserializer = new XmlSerializer (typeof(Settings));
				TextReader textReader = new StreamReader (filename);
				si = (Settings)deserializer.Deserialize (textReader);
				textReader.Close ();
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
				#if PLUS_VERSION
				_txtServerPassword.Text = (si.SettingsList [0].pass == null ? string.Empty : 
					enc.Decrypt (si.SettingsList [0].pass));
				#endif
				_swAutoConnect.On = si.SettingsList [0].auto;
			}
		}

		private string getLocationFromHost(string h)
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

