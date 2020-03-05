//
//  VMFactory_Tests.swift
//  TDD_CoordinatorsTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class VMFactory_Tests: XCTestCase {
    

    func testGivenAnAppCoordinatorWhenVMFactoryIsCalledItReturnsAVM(){
        //arrange
        let viewModelFactory = VMFactory()
        viewModelFactory.appCoordinator = MockAppCoordinator(vcFactory: MockVCFactory(), vmFactory: viewModelFactory, window: UIWindow())
        //act
        let yellowViewModel = viewModelFactory.makeYellowScreenViewModel()
        //assert
        XCTAssertNotNil(yellowViewModel)
        XCTAssertNotNil(yellowViewModel.appCoordinator)
    }
    
    func testWhenAnAppCoordinatorRequestsItReturnsABlueVM(){
        //given
        let viewModelFactory = VMFactory()
        viewModelFactory.appCoordinator = MockAppCoordinator(vcFactory: MockVCFactory(), vmFactory: viewModelFactory, window: UIWindow())
        //act
        let blueViewModel = viewModelFactory.makeBlueScreenViewModel()
        //assert
        XCTAssertNotNil(blueViewModel)
    
        
    }

}
