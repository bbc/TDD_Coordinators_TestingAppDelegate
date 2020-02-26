//
//  BlueScreenViewModel_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 26/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class BlueScreenViewModel_Tests: XCTestCase {

    func testGivenWhenABlueScreenIsShownThenThereIsFruit() {
        //arrange
        var strawberry: String? = nil
        var orange: String? = nil
        var fruit = [String?]()
        //act
        strawberry = "Strawberry"
        orange = "Orange"
        fruit.append(strawberry)
        fruit.append(orange)
        //assert
        XCTAssertNotNil(strawberry)
        XCTAssertFalse(fruit.isEmpty)
    }

}
