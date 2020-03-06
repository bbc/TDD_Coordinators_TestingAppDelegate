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
        let mockDataService = MockDataService(fruitList: nil, error: nil)
        let viewModelFactory = VMFactory(dataService: mockDataService)
        viewModelFactory.appCoordinator = MockAppCoordinator()
        //act
        let yellowViewModel = viewModelFactory.makeYellowScreenViewModel()
        //assert
        XCTAssertNotNil(yellowViewModel)
        XCTAssertNotNil(yellowViewModel.appCoordinator)
    }
    
    func testWhenAnAppCoordinatorRequestsItReturnsABlueVM(){
        //given
        let mockDataService = MockDataService(fruitList: nil, error: nil)
        let viewModelFactory = VMFactory(dataService: mockDataService)
        viewModelFactory.appCoordinator = MockAppCoordinator()
        //act
        let blueViewModel = viewModelFactory.makeBlueScreenViewModel()
        //assert
        XCTAssertNotNil(blueViewModel)
    }

}
