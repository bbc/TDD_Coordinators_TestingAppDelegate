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
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    
    
    func testGivenWhenAppIsLaunchedThenTheYellowVCIsShown() {
        XCTAssertEqual(app.otherElements["yellowVC"].exists, true)
        XCTAssertEqual(app.otherElements.buttons["Show Blue Screen"].exists, true)
    }
    
    func testGivenYouAreOnYellowVCWhenButtonIsPressedThenBlueVCIsNAvigatedTo() {
        app.otherElements.buttons["Show Blue Screen"].tap()
        
        XCTAssertEqual(app.otherElements["blueVC"].exists, true)
    }
    
            
}
