using System;
using MonoTouch.UIKit;

namespace ProScanMobile {

	public class RecTableItem {

		public string File { get; set; }

		public UITableViewCellStyle CellStyle
		{
			get { return cellStyle; }
			set { cellStyle = value; }
		}
		protected UITableViewCellStyle cellStyle = UITableViewCellStyle.Default;

		public UITableViewCellAccessory CellAccessory
		{
			get { return cellAccessory; }
			set { cellAccessory = value; }
		}
		protected UITableViewCellAccessory cellAccessory = UITableViewCellAccessory.None;

		public RecTableItem () { }

		public RecTableItem (string heading)
		{ File = heading; }
	}
}