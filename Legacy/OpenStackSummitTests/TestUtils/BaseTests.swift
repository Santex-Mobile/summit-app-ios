//
//  BaseTests.swift
//  OpenStackSummit
//
//  Created by Claudio on 9/4/15.
//  Copyright © 2015 OpenStack. All rights reserved.
//

import XCTest
import OpenStackSummit
import RealmSwift

class BaseTests: XCTestCase {
    
    var realm = try! Realm()
    
    override func setUp() {
        super.setUp()
        
        try! realm.write {
            self.realm.deleteAll()
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}