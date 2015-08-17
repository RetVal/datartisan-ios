//
//  PrimaryKey.swift
//  Datartisan
//
//  Created by closure on 8/17/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import Foundation

public typealias IDType = Int

public protocol PrimaryKeyProtocol {
    func getInKey() -> String
    func numbericKey() -> IDType
}

public class IntPK : NSObject, PrimaryKeyProtocol {
    public var ID : IDType = 0
    public func getInKey() -> String {
        return "\(ID)"
    }
    
    public func numbericKey() -> IDType {
        return ID
    }
}

public class StringPK : NSObject, PrimaryKeyProtocol {
    public var keyString : String = ""
    public func getInKey() -> String {
        return keyString
    }
    
    public func numbericKey() -> IDType {
        return IDType((keyString as NSString).integerValue)
    }
}

public class DataModel : IntPK {
    
}