using System;
using System.Threading;
using MonoTouch.Foundation;
using MonoTouch.AudioToolbox;
using MonoTouch.CoreFoundation;
using MonoTouch.AudioUnit;

namespace ProScanMobile
{
	public class StreamingPlaybackV2
	{
		AudioFileStream audioFileStream;
		AudioStreamBasicDescription dataFormat;
		OutputAudioQueue audioQueue;
		int totalPacketsReceived;

		public void ParseBytes (byte [] buffer, int count, bool discontinuity)
		{
			audioFileStream.ParseBytes (buffer, 0, count, discontinuity);
		}

		void StreamPropertyListenerProc (object sender, PropertyFoundEventArgs args)
		{
			if (args.Property == AudioFileStreamProperty.DataFormat) {
				dataFormat = audioFileStream.DataFormat;
				return;
			}

			if (args.Property != AudioFileStreamProperty.ReadyToProducePackets) 
				return;

			if (audioQueue != null) {
				// TODO: Dispose
				//throw new NotImplementedException ();
			}

			audioQueue = new OutputAudioQueue (dataFormat);
			audioQueue.OutputCompleted += HandleOutputCompleted;
		}

		public void Dispose ()
		{
			if (audioQueue != null)
				audioQueue.Dispose ();
			if (audioFileStream != null)
				audioFileStream.Dispose ();
		}

		void HandleOutputCompleted (object sender, OutputCompletedEventArgs e)
		{
			audioQueue.FreeBuffer (e.IntPtrBuffer);
		}

		public void Start ()
		{
			audioFileStream = new AudioFileStream (AudioFileType.MP3);
			audioFileStream.PropertyFound += StreamPropertyListenerProc;
			audioFileStream.PacketDecoded += StreamPacketsProc;
		}

		void StreamPacketsProc (object sender, PacketReceivedEventArgs args)
		{
			//Debug.WriteLine ("{0} packets", args.PacketDescriptions.Length);

			unsafe {
				AudioQueueBuffer* buffer;
				if (audioQueue.AllocateBuffer (args.Bytes, out buffer) != AudioQueueStatus.Ok)
					throw new ApplicationException ();

				buffer->AudioDataByteSize = (uint)args.Bytes;
				buffer->CopyToAudioData (args.InputData, args.Bytes);

				if (audioQueue.EnqueueBuffer (buffer, args.PacketDescriptions) != AudioQueueStatus.Ok)
					throw new ApplicationException ();
			}

			totalPacketsReceived += args.PacketDescriptions.Length;

			if (!audioQueue.IsRunning && totalPacketsReceived > 25) {
				var res = audioQueue.Start ();
				if (res != AudioQueueStatus.Ok)
					throw new ApplicationException (res.ToString ());
			}
		}
	}
}

