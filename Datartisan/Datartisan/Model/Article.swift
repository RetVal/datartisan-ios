//
//  Article.swift
//  Datartisan
//
//  Created by closure on 8/18/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import Foundation
import ObjectMapper

public class Article : IntPK {
    var title = ""
    var thumbnail = ""
    var published_at = 0
    override public init() {
        
    }
}

extension Article : Mappable {
    public static func newInstance() -> Mappable {
        return Article()
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        thumbnail <- map["thumbnail"]
        published_at <- map["published_at"]
    }
}
