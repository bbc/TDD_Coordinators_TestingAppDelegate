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
        //act
        let yellowVC = vcFactory.makeYellowScreen(yellowViewModel: MockYellowScreenViewModel()) as? YellowViewController
        //assert
        XCTAssertNotNil(yellowVC)
        XCTAssertNotNil(yellowVC?.yellowVM)
    }
    
    func testGivenAYellowScreenWhenTheButtonIsPressedVCFactoryReturnsABlueVC() {
        //arrange
        let vcFactory = VCFactory()
        //act
        let blueVC = vcFactory.makeBlueScreen(blueViewModel: MockBlueScreenViewModel()) as? BlueViewController
        //assert
        XCTAssertNotNil(blueVC)
        XCTAssertNotNil(blueVC?.blueVM)
    }
    
    
    
    
}


