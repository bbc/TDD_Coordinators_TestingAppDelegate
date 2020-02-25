//
//  AppCoordinator_Tests.swift
//  TDD_CoordinatorsTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class AppCoordinator_Tests: XCTestCase {
    
    
    func testGivenWhenAppIsLaunchedThenYellowScreenIsReturned(){
        //arrange
        let mockVCFactory = MockVCFactory()
        let mockVmFactory = MockVMFactory()
        let appCoordinator = AppCoordinator(vcFactory: mockVCFactory, vmFactory: mockVmFactory, window: UIWindow())
        
        //act
        
        //assert
        XCTAssertEqual(mockVCFactory.yellowScreenExists, true)
        XCTAssertNotNil(appCoordinator.yellowScreenVM)
        XCTAssertNotNil(appCoordinator.yellowVC)
        XCTAssertNotNil(mockVCFactory.yellowVM)
        XCTAssertNotNil(mockVmFactory.appCoordinator)
        
    }
    
    func testGivenYellowScreenWhenButtonIsPressedThenBlueScreenIsReturned() {
        //arrange
        let mockVCFactory = MockVCFactory()
        let appCoordinator = AppCoordinator(vcFactory: mockVCFactory, vmFactory: MockVMFactory(), window: UIWindow())
        
        //act
        appCoordinator.showBlueScreen()
        
        //assert
        XCTAssertEqual(mockVCFactory.blueScreenExists, true)
        XCTAssertNotNil(appCoordinator.blueVC)
    }
    
}


