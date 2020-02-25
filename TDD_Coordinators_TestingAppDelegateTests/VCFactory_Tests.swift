//
//  VCFactory_Tests.swift
//  TDD_CoordinatorsTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class VCFactory_Tests: XCTestCase {


    func testGivenACoordinatorWhenVCFactoryIsCalledItReturnsAVC() {
        //arrange
        let vcFactory = VCFactory()
        let mockAppCoordinator = MockAppCoordinator(vcFactory: vcFactory, vmFactory: MockVMFactory(), window: UIWindow())
  
        //act
       // mockAppCoordinator.showYellowScreen()
        
        //assert
        XCTAssertNotNil(mockAppCoordinator.yellowVC)
        XCTAssertNotNil(mockAppCoordinator.yellowVC!.yellowVM)
    }
    
    func testGivenAYellowScreenWhenTheButtonIsPressedVCFactoryReturnsABlueVC() {
          //arrange
          let vcFactory = VCFactory()
          let mockAppCoordinator = MockAppCoordinator(vcFactory: vcFactory, vmFactory: MockVMFactory(), window: UIWindow())
    
          //act
          mockAppCoordinator.showBlueScreen()
          //assert
          XCTAssertNotNil(mockAppCoordinator.blueVC)
        
    }
    

    

}


