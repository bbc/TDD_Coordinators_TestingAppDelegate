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
    
    init(type: String) {
        self.type = type
    }
}

class MockDataService: DataServiceProtocol {
    
    var fruitList: [Fruit]
    
    init(fruitList: [Fruit]) {
        self.fruitList = fruitList
    }
    
    func getFruit() -> [Fruit]? {
        return self.fruitList
    }
    
    
}

class FruitDataSource {
    var numberOfSections = 1
    var fruitList: [Fruit]? = nil
    var dataService: DataServiceProtocol?
    
    init(dataService: DataServiceProtocol?) {
        self.dataService = dataService
        fruitList = dataService?.getFruit()
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        guard section == 0 else {return 0}
        return fruitList!.count
    }
    
    func item(forRow row: Int, inSection section: Int) -> Fruit? {
        guard section == 0 else {return .none}
        guard row >= 0, fruitList!.count > row else {return .none}
        return fruitList![row]
    }
}

class FruitDataSource_Tests: XCTestCase {
    
    
        func testThereIsOneSectionOfFruit(){
            let mockDataService = MockDataService(fruitList: [.fixture()])
            let dataSource = FruitDataSource(dataService: mockDataService)
    
            XCTAssertEqual(dataSource.numberOfSections, 1)
    
        }
    
        func testNumberOFRowsOfFruit(){
            let mockDataService = MockDataService(fruitList: [.fixture(), .fixture(), .fixture()])
            let dataSource = FruitDataSource(dataService: mockDataService)
    
            XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
            XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
            XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
        }
    
        func testFruitForItsRowAndSection(){
            let mockDataService = MockDataService(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")])
            let dataSource = FruitDataSource(dataService: mockDataService)
    
            XCTAssertEqual(dataSource.item(forRow: 0, inSection: 0)?.type, "Strawberry")
            XCTAssertEqual(dataSource.item(forRow: 1, inSection: 0)?.type, "Banana")
        }
    
        func testFruitForOutOfBoundsRowAndSectionIsNill() {
            let mockDataService = MockDataService(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")])
            let dataSource = FruitDataSource(dataService: mockDataService)
    
            XCTAssertNil(dataSource.item(forRow: 2, inSection: 0))
            XCTAssertNil(dataSource.item(forRow: 0, inSection: 1))
            XCTAssertNil(dataSource.item(forRow: 2, inSection: 1))
            XCTAssertNil(dataSource.item(forRow: -1, inSection: -1))
        }
    
    
    func testTestThatFruitListIsReturned() {
        let mockDataService = MockDataService(fruitList: [.fixture()])
        let dataSource = FruitDataSource(dataService: mockDataService)
        
        XCTAssertNotNil(dataSource.fruitList)
    }
    
}

extension Fruit {
    static func fixture(name: String = "Strawberry") -> Fruit {
        return Fruit(type: name)
    }
}

protocol DataServiceProtocol {
    func getFruit() -> [Fruit]?
}
