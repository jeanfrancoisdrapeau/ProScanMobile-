using System;

namespace ProScanMobile
{
	public class ScannerAudio
	{
		private ReadWriteBuffer _listDataBuffer_Audio;

		public ScannerAudio ()
		{
			_listDataBuffer_Audio = new ReadWriteBuffer (65535);
		}

		public void processData(byte[] message, int messageLength)
		{
		}
	}
}

