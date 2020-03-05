//
//  YellowScreenViewModel_Tests.swift
//  TDD_CoordinatorsTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class YellowScreenViewModel_Tests: XCTestCase {
    
    
    func testGivenYellowScreenIsShownWhenButtonIsPressedThenWeNavigateToBlueScreen(){
        
        //arrange
        let yellowViewModel = YellowScreenViewModel()
        let mockDataService = MockDataService(fruitList: nil, error: nil)
        let mockAppCoordinator = MockAppCoordinator(vcFactory: MockVCFactory(), vmFactory: MockVMFactory(dataService: mockDataService), window: UIWindow())
        yellowViewModel.appCoordinator = mockAppCoordinator
        
        //act
        yellowViewModel.launchBlueScreen()
        
        //assert
        XCTAssertEqual(mockAppCoordinator.blueScreenExists, true)
        XCTAssertEqual(mockAppCoordinator.blueViewModelExists, true)
    }    
}




