//
//  FruitDataSource_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 26/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

struct Fruit {
    let type: String
}


class FruitDataSource_Tests: XCTestCase {
    
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
        
        func item(forRow row: Int, inSection section: Int) -> Fruit {
            return fruitList[row]
        }
    }
    
    func testThereIsOneSectionOfFruit(){
        let datasource = FruitDataSource(fruitList: [.fixture()])
        
        XCTAssertEqual(datasource.numberOfSections, 1)
        
    }
    
    func testNumberOFRowsOfFruit(){
        let datasource = FruitDataSource(fruitList: [.fixture(), .fixture(), .fixture()])
        
        XCTAssertEqual(datasource.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(datasource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(datasource.numberOfRows(inSection: -1), 0)
    }
    
    func testFruitForItsRowAndSection(){
        let datasource = FruitDataSource(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")])
        
        XCTAssertEqual(datasource.item(forRow: 0, inSection: 0).type, "Strawberry")
        XCTAssertEqual(datasource.item(forRow: 1, inSection: 0).type, "Banana")
    }
    
}

extension Fruit {
    static func fixture(name: String = "Strawberry") -> Fruit {
        return Fruit(type: name)
    }
}
