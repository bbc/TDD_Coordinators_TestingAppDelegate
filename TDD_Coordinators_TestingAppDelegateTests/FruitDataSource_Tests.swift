//
//  FruitDataSource_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 26/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class FruitDataSource_Tests: XCTestCase {
    
    struct Fruit {
        
    }
    
    struct FruitDataSource {
        var numberOfSections = 1
        let fruitList: [Fruit]
        
        init(fruitList: [Fruit]) {
            self.fruitList = fruitList
        }
    
        func numberOfRows(inSection: Int) -> Int {
            guard inSection == 0 else {return 0}
            return fruitList.count
        }
    }

    func testThereIsOneSectionOfFruit(){
        let datasource = FruitDataSource(fruitList: [Fruit()])
        
        XCTAssertEqual(datasource.numberOfSections, 1)
        
    }
    
    func testNumberOFRowsOfFruit(){
        let datasource = FruitDataSource(fruitList: [Fruit(), Fruit(), Fruit()])
        
        XCTAssertEqual(datasource.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(datasource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(datasource.numberOfRows(inSection: -1), 0)
    }

}
