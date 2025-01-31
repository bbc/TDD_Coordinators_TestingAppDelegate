//
//  TestingAppDelegateTests.swift
//  TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 25/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class AppCoordinatorTests: XCTestCase {
    
    func testThatTheDefaultScreenIsYellow(){
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let mvcf = MockVCFactory()
        let appCoordinator = AppCoordinator(vcFactory: mvcf, vmFactory: MockVMFactory(), window: window)
        
        appCoordinator.showYellowScreen()
        
        XCTAssertNotNil(mvcf.yellowVM)
        XCTAssertNotNil(window.viewWithTag(ViewTag.yellowVc.rawValue))
    }
    
    func testGivenYouAreOnYellowVCWhenButtonIsPressedThenBlueVCIsNAvigatedToUsingAWindow() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let appCoordinator = AppCoordinator(vcFactory: MockVCFactory(), vmFactory: MockVMFactory(), window: window)
        
        appCoordinator.showBlueScreen()
        
        XCTAssertNotNil(appCoordinator.blueVC)
        XCTAssertNotNil(window.viewWithTag(ViewTag.blueVc.rawValue))
    }
    
    

}

