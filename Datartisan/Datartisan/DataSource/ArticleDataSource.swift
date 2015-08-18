//
//  ArticleDataSource.swift
//  Datartisan
//
//  Created by closure on 8/18/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import Foundation
import Alamofire

public class ArticleDataSource : DataSource {
    public override func loadMore(page: Int, sinceID: IDType, maxID: IDType, count: Int, action: (ids: [PrimaryKeyProtocol], error: NSError?) -> Void) {
        
    }
    
    
}
