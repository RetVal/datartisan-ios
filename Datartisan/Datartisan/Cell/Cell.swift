//
//  Cell.swift
//  Datartisan
//
//  Created by closure on 8/17/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import UIKit

public class Cell : UITableViewCell, DataSourceUITableViewCellProtocol {
    public func renderWithContext(context: PrimaryKeyProtocol?, forIndexPath: NSIndexPath, tableView: UITableView) -> Cell {
        return self
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}
