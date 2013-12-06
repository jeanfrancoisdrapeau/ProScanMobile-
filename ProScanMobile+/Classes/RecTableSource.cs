using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile
{
	public class RecTableSource : UITableViewSource
	{
		NSIndexPath _selectRowIndex;

		List<RecTableItem> tableItems;

		NSString cellIdentifier = new NSString("TableCell");

		private const int ROW_HEIGHT = 25;

		public RecTableSource (string[] items)
		{
			tableItems = new List<RecTableItem>();
			foreach (var t in items) {
				tableItems.Add (new RecTableItem(t));
			}
		}

		public override float GetHeightForRow(UITableView tableView, NSIndexPath indexPath)
		{
			if (_selectRowIndex != null)
				if(indexPath.Row == _selectRowIndex.Row) {
					return ROW_HEIGHT + 20;
				}
			return ROW_HEIGHT;
		}

		public override string TitleForHeader (UITableView tableView, int section)
		{
			return string.Format("Saved recordings: {0}", tableItems.Count);
		}

		public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
		{
			CustomRecCell cell = tableView.DequeueReusableCell (cellIdentifier) as CustomRecCell;
			// if there are no cells to reuse, create a new one
			if (cell == null) {
				cell = new CustomRecCell (cellIdentifier);
				//cell.Accessory = UITableViewCellAccessory.DisclosureIndicator;
			}

			cell.UpdateCell (tableItems[indexPath.Row].File);

			return cell;
		}

		public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
		{
			if (_selectRowIndex != null) {
				if (indexPath != _selectRowIndex) {
					CustomRecCell cell = tableView.CellAt (_selectRowIndex) as CustomRecCell;
					if (cell != null)
						cell.CellChanged ();
				}
			}

			_selectRowIndex = indexPath;
			tableView.BeginUpdates ();
			tableView.EndUpdates ();
		}

		public override void CommitEditingStyle (UITableView tableView, UITableViewCellEditingStyle editingStyle, MonoTouch.Foundation.NSIndexPath indexPath)
		{
			switch (editingStyle) {
			case UITableViewCellEditingStyle.Delete:
				// remove file
				var documents = Environment.GetFolderPath (Environment.SpecialFolder.MyDocuments);
				var file = Path.Combine (documents, tableItems [indexPath.Row].File);
				File.Delete (file);
				// remove the item from the underlying data source
				tableItems.RemoveAt (indexPath.Row);
				// delete the row from the table
				tableView.DeleteRows (new NSIndexPath[] { indexPath }, UITableViewRowAnimation.Fade);
				tableView.ReloadData ();
				break;
			case UITableViewCellEditingStyle.None:
				Console.WriteLine ("CommitEditingStyle:None called");
				break;
			}
		}

		public override int RowsInSection (UITableView tableview, int section)
		{
			return tableItems.Count;
		}

		public override bool CanEditRow (UITableView tableView, NSIndexPath indexPath)
		{
			return true;
		}

		public override string TitleForDeleteConfirmation (UITableView tableView, NSIndexPath indexPath)
		{   
			return "Delete";
		}
	}
}

