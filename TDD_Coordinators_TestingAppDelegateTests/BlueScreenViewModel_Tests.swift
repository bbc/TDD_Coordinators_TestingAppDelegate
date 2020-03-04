//
//  BlueScreenViewModel_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest


class BlueScreenViewModel_Tests: XCTestCase {
  
    
    func testThereIsOneSectionOfFruit(){
        let mockDataService = MockDataService(fruitList: [.fixture()], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
                
        XCTAssertEqual(dataSource.numberOfSections, 1)
        
    }
    
    func testNumberOFRowsOfFruit(){
        
        let mockDataService = MockDataService(fruitList: [.fixture(), .fixture(), .fixture()], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()
        
        XCTAssertNil(dataSource.error)
        XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
    }
    
    func testFruitForItsRowAndSection(){
        let mockDataService = MockDataService(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()

        XCTAssertNil(dataSource.error)
        XCTAssertEqual(dataSource.string(forRow: 0, inSection: 0), "Strawberry")
        XCTAssertEqual(dataSource.string(forRow: 1, inSection: 0), "Banana")
    }
    
    func testFruitForOutOfBoundsRowAndSectionIsNill() {
        let mockDataService = MockDataService(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()
        
        XCTAssertNil(dataSource.string(forRow: 2, inSection: 0))
        XCTAssertNil(dataSource.string(forRow: 0, inSection: 1))
        XCTAssertNil(dataSource.string(forRow: 2, inSection: 1))
        XCTAssertNil(dataSource.string(forRow: -1, inSection: -1))
        XCTAssertNotNil(dataSource.string(forRow: 0, inSection: 0))
    }
    
    
    func testTestThatFruitListIsReturned() {
        let mockDataService = MockDataService(fruitList: [.fixture()], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()
        
        XCTAssertNil(dataSource.error)
        XCTAssertNotNil(dataSource.fruitList)
    }
    
    func testNumberOfRowsForNilFruitListIsZero() {
        let mockDataService = MockDataService(fruitList: .none, error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
         mockDataService.performGetFruitCompletion()
        
        let numberOfRows = dataSource.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numberOfRows, 0)
        
    }
    
    func testItemReturnedIsNilWhenTheFruitListIsNil() {
        let mockDataService = MockDataService(fruitList: .none, error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()
        
        let itemReturned = dataSource.string(forRow: 0, inSection: 0)
        
        XCTAssertNil(itemReturned)
    }
    
    func testErrorReturnedWhenThereWasanErrorRetrievingTheData() {
        let mockDataService = MockDataService(fruitList: .none, error: NetworkingError.dataNotFound)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        
        mockDataService.performGetFruitCompletion()
        
        XCTAssertNil(dataSource.fruitList)
        XCTAssertNotNil(dataSource.error)
        
    }
    
    func testWhenFruitListIsReturnedDidGetDataIsCalledAndDidGetErrorIsNot() {
        let mockDataService = MockDataService(fruitList: [.fixture(name: "Strawberry"), .fixture(name: "Banana")], error: nil)
        let dataSource = BlueScreenViewModel(dataService: mockDataService)
        let mockBlueVC = MockBlueViewController(blueVM: dataSource)
        dataSource.delegate = mockBlueVC
        mockDataService.performGetFruitCompletion()
        
        XCTAssertTrue(mockBlueVC.didGetDataWasCalled)
        XCTAssertFalse(mockBlueVC.didGetErrorWasCalled)
    }
    
    func testWhenFruitListIsNilDidGetDataIsNotCalledAndDidGEtErrorIs() {
        
        let mockDataService = MockDataService(fruitList: .none, error: NetworkingError.dataNotFound)
              let dataSource = BlueScreenViewModel(dataService: mockDataService)
              let mockBlueVC = MockBlueViewController(blueVM: dataSource)
              dataSource.delegate = mockBlueVC
              mockDataService.performGetFruitCompletion()
        
        XCTAssertFalse(mockBlueVC.didGetDataWasCalled)
        XCTAssertTrue(mockBlueVC.didGetErrorWasCalled)
        XCTAssertEqual(mockBlueVC.errorMessage, "An error has occurred")
    }
    
    
    
}

extension Fruit {
    static func fixture(name: String = "Strawberry") -> Fruit {
        return Fruit(type: name)
    }
}



