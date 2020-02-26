//
//  FruitDataSource_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 26/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitDataSource_Tests: XCTestCase {
    
    struct FruitDataSource {
        var numberOfSections = 1
    }

    func testThereIsOneSectionOfFruit(){
        let datasource = FruitDataSource()
        
        XCTAssertEqual(datasource.numberOfSections, 1)
        
    }
    

}
