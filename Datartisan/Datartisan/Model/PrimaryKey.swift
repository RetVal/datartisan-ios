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

public class IntPK : PrimaryKeyProtocol {
    public var ID : IDType = 0
    public func getInKey() -> String {
        return "\(ID)"
    }
    
    public func numbericKey() -> IDType {
        return ID
    }
}

public class StringPK : PrimaryKeyProtocol {
    public var keyString : String = ""
    public func getInKey() -> String {
        return keyString
    }
    
    public func numbericKey() -> IDType {
        return IDType((keyString as NSString).integerValue)
    }
}

extension String : PrimaryKeyProtocol {
    public func getInKey() -> String {
        return self
    }
    
    public func numbericKey() -> IDType {
        return IDType((getInKey() as NSString).integerValue)
    }
}

extension Int : PrimaryKeyProtocol {
    public func getInKey() -> String {
        return "\(self)"
    }
    
    public func numbericKey() -> IDType {
        return IDType(self)
    }
}

extension NSString : PrimaryKeyProtocol {
    public func getInKey() -> String {
        return self as String
    }
    
    public func numbericKey() -> IDType {
        return IDType(self.integerValue)
    }
}

extension NSNumber : PrimaryKeyProtocol {
    public func getInKey() -> String {
        return self.description as String
    }
    
    public func numbericKey() -> IDType {
        return IDType(self.unsignedLongLongValue)
    }
}

public class DataModel : IntPK {
    
}