using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile
{
	public class AlertTableSource : UITableViewSource
	{
		List<AlertTableItem> tableItems;

		NSString cellIdentifier = new NSString("TableCell");

		private const int ROW_HEIGHT = 40;

		public AlertTableSource (List<ScannerLog.LogsDisplay> items)
		{
			tableItems = new List<AlertTableItem>();
			foreach (var t in items) {

				AlertTableItem ati = new AlertTableItem ();
				ati.Sys = t.sys;
				ati.Grp = t.grp;
				ati.Alert = t.alert;

				tableItems.Add (ati);
			}
		}

		public override float GetHeightForRow(UITableView tableView, NSIndexPath indexPath)
		{
			return ROW_HEIGHT;
		}

		public override string TitleForHeader (UITableView tableView, int section)
		{
			return string.Format("Logs: {0}", tableItems.Count);
		}

		public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
		{
			CustomLogCell cell = tableView.DequeueReusableCell (cellIdentifier) as CustomLogCell;
			// if there are no cells to reuse, create a new one
			if (cell == null) {
				cell = new CustomLogCell (cellIdentifier);
				//cell.Accessory = UITableViewCellAccessory.DisclosureIndicator;
			}

			cell.UpdateCell (tableItems[indexPath.Row].Sys, 
				tableItems[indexPath.Row].Grp,
				tableItems[indexPath.Row].Alert
			);

			return cell;
		}

		public override int RowsInSection (UITableView tableview, int section)
		{
			return tableItems.Count;
		}

		public override bool CanEditRow (UITableView tableView, NSIndexPath indexPath)
		{
			return false;
		}
	}
}

