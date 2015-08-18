//
//  DataSource.swift
//  Datartisan
//
//  Created by closure on 8/17/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import UIKit

protocol DataSourceUITableViewCellProtocol {
    func renderWithContext(context: PrimaryKeyProtocol?, forIndexPath: NSIndexPath, tableView: UITableView) -> Cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath :NSIndexPath) -> CGFloat
}

public class DataSource : NSObject, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    public typealias DoneAction = (error: NSError?) -> Void
    
    public var ids : [PrimaryKeyProtocol] = []
    public var sinceID : IDType = 0
    public var maxID : IDType = 0
    public var page = 0
    
    @IBInspectable public var isHeightCacheEnabled : Bool = false
    
    public var lastPackageCount : Int {
        return _lastPackageCount
    }
    
    private var _lastPackageCount : Int = 0
    
    public class var pageCount : Int {
        return 20
    }
    
    public var isEmpty : Bool {
        return ids.count == 0
    }
    
    public func updateIds() {
        if ids.count != 0 {
            sinceID = ids.first!.numbericKey()
            maxID = ids.last!.numbericKey()
        }
    }
    
    public func refresh(action: DoneAction) {
        __resetIds()
        loadMore(0, action: action)
    }
    
    public func loadMore(page: Int, action: DoneAction) {
        loadMore(page, count: self.dynamicType.pageCount, action: action)
    }
    
    public func loadMore(page: Int, count: Int, action: DoneAction) {
        var sid : IDType = 0
        var mid : IDType = 0
        if self.page < page {
            sid = 0
            mid = self.maxID
        } else {
            sid = self.sinceID
            mid = 0
        }
        loadMore(page, sinceID: sid, maxID: mid, count: count) { (ids, error) -> Void in
            if error != nil {
                return action(error: error)
            }
            self._lastPackageCount = ids.count
            if ids.count != 0 {
                self.finishLoad(ids, forPage: page)
                if page <= 0 {
                    if (self.ids.count > 0) {
                        self.updateIds()
                        if page == 0 {
                            // update storage
                        } else if (sid != self.sinceID) {
                            // update storage
                        }
                    }
                }
                self.page = page
                self.updateIds()
            }
            action(error: error)
        }
    }
    
    public func cellForRowAtIndexPath(indexPath: NSIndexPath) -> Cell {
        fatalError("should be overidden")
    }
    
    public func lazyLoadingCellForRowAtIndexPath(indexPath: NSIndexPath) -> Cell {
        fatalError("should be overidden")
    }
    
    public func loadMore(page: Int, sinceID: IDType, maxID: IDType, count: Int, action: (ids: [PrimaryKeyProtocol], error: NSError?) -> Void) {
        fatalError("should be overidden")
    }
    
    public func cleanupIdsIfNeeded(page: Int) {
        if page == 0 {
            ids.removeAll()
        }
    }
    
    public func finishLoad(ids: [PrimaryKeyProtocol], forPage page: Int) {
        cleanupIdsIfNeeded(page)
        self.ids += ids
    }
    
    public func contextForIndexPath(indexPath: NSIndexPath) -> PrimaryKeyProtocol? {
        if (self.ids.count <= indexPath.row) {
            return nil;
        }
        return self.ids[indexPath.row]
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, withIdentifier identifier: String, forClass cellClass: AnyClass) -> Cell {
        var c = tableView.cellForRowAtIndexPath(indexPath)
        if (nil != c || c?.isKindOfClass(cellClass) == false) {
            c = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        }
        if nil != c {
            c = tableView.dequeueReusableCellWithIdentifier(identifier)
        }
        return c as! Cell
    }
    
    // #pragma mark - UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cellForRowAtIndexPath(indexPath)
        return cell.renderWithContext(self.contextForIndexPath(indexPath), forIndexPath: indexPath, tableView: tableView)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ids.count
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = lazyLoadingCellForRowAtIndexPath(indexPath)
        if self.isHeightCacheEnabled {
            // get height cache
        }
        return cell.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    private func __resetIds() {
        _lastPackageCount = 0
        sinceID = 0
        maxID = 0
        page = 0
    }
}
