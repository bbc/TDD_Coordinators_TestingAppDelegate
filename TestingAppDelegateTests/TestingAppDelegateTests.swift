//
//  TestingAppDelegateTests.swift
//  TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 25/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class TestingAppDelegateTests: XCTestCase {

    func testGivenYouAreOnYellowVCWhenButtonIsPressedThenBlueVCIsNAvigatedToUsingAWindow() {
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let appCoordinator = AppCoordinator(vcFactory: VCFactory(), vmFactory: VMFactory(), window: window)
        
        appCoordinator.showBlueScreen()
        
        XCTAssertNotNil(window.viewWithTag(2))
        XCTAssertFalse(window.viewWithTag(2)!.isHidden)
        
        
    }
    
    
    func testThatTheDefaultScreenIsYellow(){
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let appCoordinator = AppCoordinator(vcFactory: VCFactory(), vmFactory: VMFactory(), window: window)
        
        appCoordinator.showYellowScreen()

        XCTAssertNotNil(window.viewWithTag(1))
        XCTAssertFalse(window.viewWithTag(1)!.isHidden)
    }
    
    

}
