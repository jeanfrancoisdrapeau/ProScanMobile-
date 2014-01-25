using System;
using MonoTouch.UIKit;

namespace ProScanMobile {

	public class TableItem {

		public UIImage Image { get; set; }
		public string Host { get; set; }
		public string Port { get; set; }
		public string Description { get; set; }
		public string Country { get; set; }
		public string State { get; set; }
		public string County { get; set; }

		public TableItem () { }

		public TableItem (string heading)
		{ Host = heading; }
	}
}