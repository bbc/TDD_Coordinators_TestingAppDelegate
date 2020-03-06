//
//  TDD_CoordinatorsUITests.swift
//  TDD_CoordinatorsUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class TDD_CoordinatorsUITests: XCTestCase {
    
    var app:  XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    
    func testGivenYouAreOnYellowVCWhenButtonIsPressedThenBlueVCIsNAvigatedTo() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        
        app.otherElements.buttons["Show Blue Screen"].tap()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            XCTAssertEqual(self.app.otherElements["blueVC"].exists, true)
            XCTAssertEqual(self.app.tables["fruitTableView"].exists, true)
            XCTAssertEqual(self.app.tables["fruitTableView"].staticTexts["apple"].exists, true)
            asyncExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.5, handler: nil)
    }
    
            
}
