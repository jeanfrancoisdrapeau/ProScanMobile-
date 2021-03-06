using System;
using System.Linq;
using System.Collections.Concurrent;

namespace ProScanMobile
{
	public class ScannerScreen
	{
		private class messageStruct
		{
			public byte[] all_data { get; set; }
			public int length { get; set; }
		}

		private string _scannerScreen_Model;
		public string scannerScreen_Model { get { return _scannerScreen_Model; } }

		private int _scannerScreen_Signal;
		public int scannerScreen_Signal { get { return _scannerScreen_Signal; } }

		private string _scannerScreen_Line1;
		public string scannerScreen_Line1 { get { return _scannerScreen_Line1; } }
		private string _scannerScreen_Line2;
		public string scannerScreen_Line2 { get { return _scannerScreen_Line2; } }
		private string _scannerScreen_Line3;
		public string scannerScreen_Line3 { get { return _scannerScreen_Line3; } }
		private string _scannerScreen_Line4;
		public string scannerScreen_Line4 { get { return _scannerScreen_Line4; } }
		private string _scannerScreen_Line5;
		public string scannerScreen_Line5 { get { return _scannerScreen_Line5; } }

	 	private BlockingCollection<messageStruct> _listDataBuffer_Screen;

		public ScannerScreen ()
		{
			_listDataBuffer_Screen = new BlockingCollection<messageStruct> ();
		}

		public void Dispose()
		{
			_listDataBuffer_Screen = null;
		}

		public void processData(byte[] message, int messageLength)
		{
			messageStruct ms = new messageStruct();
			ms.all_data = new byte[messageLength];
			Array.ConstrainedCopy (message, 0, ms.all_data, 0, ms.all_data.Length);;
			ms.length = messageLength;

			// Add messagestruct to the real list that is thread safe
			_listDataBuffer_Screen.Add (ms);
			ms = null;

			if (_listDataBuffer_Screen.Count > 0) {
				if (_listDataBuffer_Screen.ElementAt<messageStruct> (0) != null) {
					// DATA
					try
					{
						// Extract the first message
						byte[] data = new byte[_listDataBuffer_Screen.ElementAt<messageStruct> (0).length];
						Array.ConstrainedCopy (_listDataBuffer_Screen.ElementAt<messageStruct> (0).all_data, 0, data, 0, data.Length);

						string sdata = bytesToString (data).Trim ();
						string scase = sdata.Substring (15, 4);

						//Console.WriteLine(sdata);

						string[] ps01;
						string[] ps02;
						string[] ps30;
						string[] ps01_system_details;
						string[] ps02_system_details;
						string[] ps30_system_details;
						string[] ps30_system_details_glg;
						string[] ps30_system_details_pwr;

						// Based on the metadata type
						switch (scase) {
						case "PS01":

							//Console.WriteLine(sdata);

							ps01 = sdata.Split ('\r');
							ps01_system_details = ps01 [0].Split (',');

							_scannerScreen_Model = ps01_system_details [1].Trim ();

							break;
						case "PS02":

							//Console.WriteLine(sdata);

							ps02 = sdata.Split ('\r');
							ps02_system_details = ps02 [0].Split (',');

							_scannerScreen_Model = string.Format("{0} *ADMIN*", ps02_system_details [1].Trim ());

							break;
						case "PS30":
							// The scanner screen
							// Scanner model, Signal strength
							// Line 1: System
							// Line 2: Group
							// Line 3: Frequency
							// Line 4: Activated systems
							// Line 5: Activated groups per system

							//Console.WriteLine(sdata);

							ps30 = sdata.Split ('\r');

							ps30_system_details = ps30 [6].Split (',');

							int.TryParse(ps30_system_details[1].Trim(), out _scannerScreen_Signal);

							ps30_system_details = ps30 [2].Split (',');

							if (ps30_system_details [3] == "________________")
							{
								_scannerScreen_Line1 = ps30_system_details [2].Trim ();
								_scannerScreen_Line2 = ps30_system_details [5].Trim () == string.Empty ? 
								                       ps30_system_details [4].Trim () : 
								                       "[" + ps30_system_details [4].Trim () + "]";
								_scannerScreen_Line3 = ps30_system_details [7].Trim () == string.Empty ? 
								                       ps30_system_details [6].Trim () : 
								                       "[" + ps30_system_details [6].Trim () + "]";
								_scannerScreen_Line4 = ps30_system_details [9].Trim () == string.Empty ? 
								                       ps30_system_details [8].Trim () : 
								                       "[" + ps30_system_details [8].Trim () + "]";
								_scannerScreen_Line5 = string.Empty;
							}
							else {

								//Console.WriteLine(BitConverter.ToString(System.Text.Encoding.ASCII.GetBytes( ps30_system_details [2])));

								ps30_system_details_glg = ps30 [3].Split(',');
								ps30_system_details_pwr = ps30 [6].Split(',');

								_scannerScreen_Line1 = ps30_system_details [4].Trim (); 

								string line2 = ps30_system_details [6];
								//0x3F a flusher
								_scannerScreen_Line2 = line2.Replace((char)0x3f, ' '); 

								string glgType = ps30_system_details_glg[2].Trim();
								string pwrFreq = ps30_system_details_pwr[2].Trim();

								if (pwrFreq != string.Empty)
									pwrFreq = string.Format("{0}.{1}", 
										pwrFreq.Substring(0,4).TrimStart('0'),
										pwrFreq.Substring(4,4));

								_scannerScreen_Line3 = string.Format("{0} {1}",
									glgType,
									pwrFreq);

								_scannerScreen_Line4 = ps30_system_details [10].Trim ();

								_scannerScreen_Line5 = ps30_system_details [12].Trim ();
							}
							break;
						}
					} catch {
					}
				}

				// Remove the up-most message from list
				// Thread safe
				_listDataBuffer_Screen.Take ();
			} 
		}

		private string bytesToString(byte[] b)
		{
			// Return a string encoded byte array
			return System.Text.Encoding.ASCII.GetString (b);
		}
	}
}

