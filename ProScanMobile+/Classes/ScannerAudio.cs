using System;
using System.IO;
using MonoTouch.AudioToolbox;
using MonoTouch.AVFoundation;

namespace ProScanMobile
{
	public class ScannerAudio
	{
		StreamingPlaybackV2 _streamingPlayer;

		private ReadWriteBuffer _listDataBuffer_Audio;

		int[,,] mpegBitrates = new int[4, 4, 16]
		{
			{ // Version 2.5
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Reserved
				{ 0,   8,  16,  24,  32,  40,  48,  56,  64,  80,  96, 112, 128, 144, 160, 0 }, // Layer 3
				{ 0,   8,  16,  24,  32,  40,  48,  56,  64,  80,  96, 112, 128, 144, 160, 0 }, // Layer 2
				{ 0,  32,  48,  56,  64,  80,  96, 112, 128, 144, 160, 176, 192, 224, 256, 0 }  // Layer 1
			},
			{ // Reserved
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Invalid
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Invalid
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Invalid
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }  // Invalid
			},
			{ // Version 2
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Reserved
				{ 0,   8,  16,  24,  32,  40,  48,  56,  64,  80,  96, 112, 128, 144, 160, 0 }, // Layer 3
				{ 0,   8,  16,  24,  32,  40,  48,  56,  64,  80,  96, 112, 128, 144, 160, 0 }, // Layer 2
				{ 0,  32,  48,  56,  64,  80,  96, 112, 128, 144, 160, 176, 192, 224, 256, 0 }  // Layer 1
			},
			{ // Version 1
				{ 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0 }, // Reserved
				{ 0,  32,  40,  48,  56,  64,  80,  96, 112, 128, 160, 192, 224, 256, 320, 0 }, // Layer 3
				{ 0,  32,  48,  56,  64,  80,  96, 112, 128, 160, 192, 224, 256, 320, 384, 0 }, // Layer 2
				{ 0,  32,  64,  96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 0 }, // Layer 1
			}
		};

		int[,] mpegSrates = new int[4, 4]
		{
			{ 11025, 12000,  8000, 0 }, // MPEG 2.5
			{     0,     0,     0, 0 }, // Reserved
			{ 22050, 24000, 16000, 0 }, // MPEG 2
			{ 44100, 48000, 32000, 0 }  // MPEG 1
		};

		int[,] mpegFrameSamples = new int[4, 4]
		{
			//Rsvd     3     2     1    < Layer  v Version
			{    0,  576, 1152,  384 }, //       2.5
			{    0,    0,    0,    0 }, //       Reserved
			{    0,  576, 1152,  384 }, //       2
			{    0, 1152, 1152,  384 }  //       1
		};

		int[] mpegSlotSize = new int[4] {0, 1, 1, 4}; // Rsvd, 3, 2, 1

		private int _minBuffer = 500;

		private string _scannerAudio_Mpeg;
		public string scannerAudio_Mpeg { get { return _scannerAudio_Mpeg; } }
		private string _scannerAudio_Freq;
		public string scannerAudio_Freq { get { return _scannerAudio_Freq; } }
		private string _scannerAudio_Rate;
		public string scannerAudio_Rate { get { return _scannerAudio_Rate; } }

		private bool _scannerAudio_Buffering;
		public bool scannerAudio_Buffering { get { return _scannerAudio_Buffering; } }

		private FileStream _fileOut;
		private bool _writeToFile;

		const int INDEX_DATA_START_AT = 21;

		public ScannerAudio ()
		{
			_writeToFile = false;
			_listDataBuffer_Audio = new ReadWriteBuffer (65535);
			_streamingPlayer = new StreamingPlaybackV2 ();
			_streamingPlayer.Start ();
		}

		public void Dispose()
		{
			if (_writeToFile)
				StopOutputToFile ();

			_listDataBuffer_Audio = null;
			_streamingPlayer.Dispose ();
			_streamingPlayer = null;
		}

		public void PrepareOutputToFile()
		{
			string f = string.Format ("proscanmobile_{0:D4}{1:D2}{2:D2}-{3:D2}{4:D2}{5:D2}.mp3",
				DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day,
				DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);

			var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
			var filename = Path.Combine (documents, f);

			_fileOut = new FileStream (filename, FileMode.Create);

			_writeToFile = true;

			Console.WriteLine ("------ DID PrepareOutputToFile");
		}

		public void StopOutputToFile()
		{
			_writeToFile = false;

			if (_fileOut != null) {
				_fileOut.Close ();
				_fileOut.Dispose ();
			}

			Console.WriteLine ("----- DID StopOutputToFile");
		}

		public void processData(byte[] message, int messageLength)
		{
			byte [] usefull_data = new byte[messageLength - 28];
			Array.ConstrainedCopy (message, INDEX_DATA_START_AT, usefull_data, 0, usefull_data.Length);

			// Write the array to the end of the real audio array
			// This array is thread safe
			_listDataBuffer_Audio.Write (usefull_data);
			usefull_data = null;

			if (_listDataBuffer_Audio.Count > _minBuffer) {

				_scannerAudio_Buffering = false;

				// Check if the 4 left-most bytes construct an mp3 header
				if (isValidHeader (_listDataBuffer_Audio.Read (4, true), 0)) {
					// Header found, continue normaly
					// Get frame specs
					byte[] m_referenceHeader = new byte[4];
					Array.ConstrainedCopy (_listDataBuffer_Audio.Read (4, true), 0, m_referenceHeader, 0, 4);

					int ver = (int)((m_referenceHeader [1] & 0x18) >> 3);   // Version index
					int lyr = (int)((m_referenceHeader [1] & 0x06) >> 1);   // Layer index
					int brx = (int)((m_referenceHeader [2] & 0xf0) >> 4);   // Bitrate index
					int srx = (int)((m_referenceHeader [2] & 0x0c) >> 2);   // SampRate index

					// Lookup real values of these fields
					int bitrate = mpegBitrates [ver, lyr, brx] * 1000;
					int samprate = mpegSrates [ver, srx];

					string sver = "";
					switch (ver) {
					case 1:
						sver = "I";
						break;
					case 2:
						sver = "II";
						break;
					case 3:
						sver = "III";
						break;
					}

					_scannerAudio_Mpeg = string.Format ("MPEG {0}, LYR {1}", lyr, sver);
					_scannerAudio_Freq = string.Format ("{0} Hz", samprate);
					_scannerAudio_Rate = string.Format ("{0} Bps", bitrate);

					// Get frame size
					int m_frameSize = getFrameSize (_listDataBuffer_Audio.Read (4, true), 0);

					// Minimum buffer is now the mp3 frame size + 1
					// Since proscan server sends audio in CBR, this is safe to use
					_minBuffer = m_frameSize + 1;

					// Store data in audio buffer
					// This time, Read consume the left-most bytes in the array (thread safe)
					byte[] outbuf = new byte[m_frameSize];
					outbuf = _listDataBuffer_Audio.Read (m_frameSize);

					_streamingPlayer.ParseBytes (outbuf, m_frameSize, true);

					if (_writeToFile) {
						_fileOut.Write (outbuf, 0, m_frameSize);
					Console.WriteLine ("----- DID WRITETOFILE");
					}

				} else {
					// The 4 left-most bytes are not a header
					// Discard first byte
					// Thread safe
					_listDataBuffer_Audio.Read (1);

					//Console.WriteLine ("Skip 1 byte");
				}
			} else {
				_scannerAudio_Buffering = true;
			}
		}

		private int getFrameSize(byte[] dataStream, int headerStartIndex)
		{
			// Data to be extracted from the header
			int ver = (int)((dataStream[headerStartIndex + 1] & 0x18) >> 3);   // Version index
			int lyr = (int)((dataStream[headerStartIndex + 1] & 0x06) >> 1);   // Layer index
			int pad = (int)((dataStream[headerStartIndex + 2] & 0x02) >> 1);   // Padding? 0/1
			int brx = (int)((dataStream[headerStartIndex + 2] & 0xf0) >> 4);   // Bitrate index
			int srx = (int)((dataStream[headerStartIndex + 2] & 0x0c) >> 2);   // SampRate index

			// Lookup real values of these fields
			int bitrate = mpegBitrates[ver,lyr,brx] * 1000;
			int samprate = mpegSrates[ver,srx];
			int samples = mpegFrameSamples[ver,lyr];
			int slot_size = mpegSlotSize[lyr];

			// In-between calculations
			float bps = (float)samples / 8.0f;
			float fsize = ((bps * (float)bitrate) / (float)samprate)
			              + (pad == 1 ? slot_size : 0);

			// Frame sizes are truncated integers
			return (int)fsize;
		}

		private bool isValidHeader(byte[] dataStreamDouble, int i)
		{
			// Make sure that we are dealing with a valid mp3 header
			ulong bithdr = (ulong)(((dataStreamDouble[i] & 255) << 24) | ((dataStreamDouble[i + 1] & 255) << 16) | ((dataStreamDouble[i + 2] & 255) << 8) | ((dataStreamDouble[i + 3] & 255)));

			if (((dataStreamDouble[i] & 0xFF) != 0xFF)
				|| ((dataStreamDouble[i + 1] & 0xE0) != 0xE0)   // 3 sync bits
				|| ((dataStreamDouble[i + 1] & 0x18) == 0x08)   // Version rsvd
				|| ((dataStreamDouble[i + 1] & 0x06) == 0x00)   // Layer rsvd
				|| ((dataStreamDouble[i + 2] & 0xF0) == 0xF0)   // Bitrate rsvd
			) return false;

			return (((getFrameSync(bithdr) & 2047) == 2047) &&
				((getVersionIndex(bithdr) & 3) != 0) &&
				((getVersionIndex(bithdr) & 3) != 1) &&
				((getLayerIndex(bithdr) & 3) == 1) &&
				((getBitrateIndex(bithdr) & 15) != 0) &&
				((getBitrateIndex(bithdr) & 15) != 15) &&
				((getProtectionIndex(bithdr) & 1) == 1) &&              
				((getOriginalIndex(bithdr) & 1) == 1) &&
				((getEmphasisIndex(bithdr) & 3) == 0) &&
				((getFrequencyIndex(bithdr) & 3) != 3));
		}

		private int getFrameSync(ulong bithdr)
		{
			return (int)((bithdr >> 21) & 2047);
		}

		private int getVersionIndex(ulong bithdr)
		{
			return (int)((bithdr >> 19) & 3);
		}

		private int getLayerIndex(ulong bithdr)
		{
			return (int)((bithdr >> 17) & 3);
		}

		private int getProtectionIndex(ulong bithdr)
		{
			return (int)((bithdr >> 16) & 1);
		}

		private int getBitrateIndex(ulong bithdr)
		{
			return (int)((bithdr >> 12) & 15);
		}

		private int getFrequencyIndex(ulong bithdr)
		{
			return (int)((bithdr >> 10) & 3);
		}

		private int getOriginalIndex(ulong bithdr)
		{
			return (int)((bithdr >> 2) & 1);
		}

		private int getEmphasisIndex(ulong bithdr)
		{
			return (int)(bithdr & 3);
		}
	}
}

