//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import XCTest
@testable import TaskManager

class TaskManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCreateTask() {
        let task = Task()
        XCTAssertFalse(task.completed, "Task can't be completed")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
