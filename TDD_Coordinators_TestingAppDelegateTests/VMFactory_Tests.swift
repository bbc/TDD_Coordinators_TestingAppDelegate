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
        let mockAppCoordinator = MockAppCoordinator(vcFactory: MockVCFactory(), vmFactory: VMFactory(), window: UIWindow())
        //act
        //assert
        XCTAssertNotNil(mockAppCoordinator.yellowScreenVM)
        XCTAssertNotNil(mockAppCoordinator.yellowScreenVM?.appCoordinator)
    }

}
