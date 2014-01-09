using System;
using MonoTouch.UIKit;

namespace ProScanMobile {

	public class AlertTableItem {

		public string Sys { get; set; }
		public string Grp { get; set; }
		public bool Alert { get; set; }

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

		public AlertTableItem () { }

		public AlertTableItem (string heading)
		{ Sys = heading; }
	}
}