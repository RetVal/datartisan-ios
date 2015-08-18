//
//  WebAccess.swift
//  Datartisan
//
//  Created by closure on 8/18/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import Foundation
import Alamofire

public class WebAccess {
    class public var Server : String {
        return "http://datartisan.com/api/"
    }
    
    class public var Service : String {
        return ""
    }
    
    class public func RequestGet(api:String, params: [String: String], action: (NSURLRequest?, NSHTTPURLResponse?, NSData?, NSError?) -> Void) {
        let _api = Server + Service + api
        Alamofire.request(.GET, _api, parameters: params).response(completionHandler: action)
    }
    
    class public func RequestPost(api:String, params: [String: String], action: (NSURLRequest?, NSHTTPURLResponse?, NSData?, NSError?) -> Void) {
        let _api = Server + Service + api
        Alamofire.request(.POST, _api, parameters: params).response(completionHandler: action)
    }
}
