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
        let mockDataService = MockDataService(fruitList: nil, error: nil)

        let appCoordinator = AppCoordinator(vcFactory: MockVCFactory(), vmFactory: MockVMFactory(dataService: mockDataService), window: window)
        
        appCoordinator.showYellowScreen()
        
        XCTAssertNotNil(appCoordinator.yellowVC)
        XCTAssertNotNil(appCoordinator.yellowScreenVM)
        XCTAssertNotNil(window.viewWithTag(1))
    }
    
    func testGivenYouAreOnYellowVCWhenButtonIsPressedThenBlueVCIsNAvigatedToUsingAWindow() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let mockDataService = MockDataService(fruitList: nil, error: nil)
        let appCoordinator = AppCoordinator(vcFactory: MockVCFactory(), vmFactory: MockVMFactory(dataService: mockDataService), window: window)
        
        appCoordinator.showBlueScreen()
        
        XCTAssertNotNil(appCoordinator.blueVC)
        XCTAssertNotNil(window.viewWithTag(2))
    }
    
    

}
