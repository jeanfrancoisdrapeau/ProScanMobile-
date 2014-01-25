using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace ProScanMobile 
{
	public class TableSource : UITableViewSource 
	{
		NSIndexPath _selectRowIndex;

		Dictionary<string, List<TableItem>> indexedTableItems;
		string[] keys;

		NSString cellIdentifier = new NSString("TableCell");
	
		private const int ROW_HEIGHT = 60;

		public TableSource (List<TableItem> items)
		{
			indexedTableItems = new Dictionary<string, List<TableItem>>();
			foreach (var t in items) {
				if (indexedTableItems.ContainsKey (t.Description[0].ToString ().ToUpper ())) {
					indexedTableItems[t.Description[0].ToString ().ToUpper ()].Add(t);
				} else {
					indexedTableItems.Add (t.Description[0].ToString ().ToUpper (), new List<TableItem>() {t});
				}
			}
			keys = indexedTableItems.Keys.ToArray ();
		}

		public override float GetHeightForRow(UITableView tableView, NSIndexPath indexPath)
		{
			#if PLUS_VERSION
			if (_selectRowIndex != null) {
				if (indexPath.Row == _selectRowIndex.Row &
					indexPath.Section == _selectRowIndex.Section) {
						return ROW_HEIGHT + 20;
					}
			}
			#endif
			return ROW_HEIGHT;
		}

		public override int NumberOfSections (UITableView tableView)
		{
			return keys.Length;
		}

		public override int RowsInSection (UITableView tableview, int section)
		{
			return indexedTableItems[keys[section]].Count;
		}

		public override string[] SectionIndexTitles (UITableView tableView)
		{
			return indexedTableItems.Keys.ToArray ();
		}

		public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
		{
			vcOptionsScreen.txtSH.Text = indexedTableItems [keys [indexPath.Section]] [indexPath.Row].Host;
			vcOptionsScreen.txtSP.Text = indexedTableItems [keys [indexPath.Section]] [indexPath.Row].Port;

			#if PLUS_VERSION
			vcOptionsScreen.txtPW.Text = string.Empty;
			#endif

			_selectRowIndex = indexPath;
			tableView.BeginUpdates ();
			tableView.EndUpdates ();
			//tableView.DeselectRow (indexPath, true);
		}

		public override UITableViewCell GetCell (UITableView tableView, MonoTouch.Foundation.NSIndexPath indexPath)
		{
			// request a recycled cell to save memory
			CustomServerCell cell = tableView.DequeueReusableCell (cellIdentifier) as CustomServerCell;

			// if there are no cells to reuse, create a new one
			if (cell == null) {
				cell = new CustomServerCell (cellIdentifier);
			}

			cell.UpdateCell (indexedTableItems[keys[indexPath.Section]][indexPath.Row].Image
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].Host
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].Port
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].Description
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].Country
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].State
				, indexedTableItems[keys[indexPath.Section]][indexPath.Row].County );
			
			return cell;
		}

		public override string TitleForHeader (UITableView tableView, int section)
		{
			return keys[section].ToString();
		}
	}
}