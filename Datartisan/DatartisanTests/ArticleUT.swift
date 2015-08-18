//
//  ArticleUT.swift
//  Datartisan
//
//  Created by closure on 8/18/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import XCTest
import Datartisan

class ArticleUT : XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetArticleList() {
        let wait = self.expectationWithDescription("get article list");
        AritcleWebAccess.Get(1, count: 20) { (articles, error) -> Void in
            wait.fulfill()
            guard let ats = articles else {
                if error != nil {
                    return print(error)
                }
                return print("empty")
            }
            print(ats)
        }
        self.waitForExpectationsWithTimeout(10) { (error) -> Void in
            guard let err = error else {
                return
            }
            print(err)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}