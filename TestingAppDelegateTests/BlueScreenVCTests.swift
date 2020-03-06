//
//  BlueScreenVCTests.swift
//  TestingAppDelegateTests
//
//  Created by Sabrina Tardio on 05/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class BlueScreenVCTests: XCTestCase {
    
    func testBlueVCExistsAndHasATableView() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let vc = VCFactory().makeBlueScreen(blueViewModel: MockVMFactory().makeBlueScreenViewModel())
        
        window.rootViewController = vc
        let theView = window.viewWithTag(ViewTag.blueVc.rawValue)
        let tableView = window.viewWithTag(ViewTag.blueVCTableView.rawValue) as! UITableView
        let tableViewCellNumber = tableView.numberOfRows(inSection: 0)
        
        XCTAssertNotNil(theView)
        XCTAssertNotNil(tableView)
        XCTAssertEqual(tableViewCellNumber, 0)
    }
    
    
    func testBlueVCShowsFruitWhenDataReturned() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let mvm = MockBlueScreenViewModel(fruit: [Fruit(type: "apple", price: 2, weight: 1), Fruit(type: "banana", price: 5, weight: 5), Fruit(type: "pear", price: 2, weight: 2)])
        let vc = VCFactory().makeBlueScreen(blueViewModel: mvm) as! BlueViewController
        
        window.rootViewController = vc
        vc.didGetData()
        let tableView = window.viewWithTag(ViewTag.blueVCTableView.rawValue) as! UITableView
        let tableViewCellNumber = tableView.numberOfRows(inSection: 0)
        let firstCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        let firstCellLable = firstCell?.textLabel?.text
        let secondCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0))
        let secondCellLable = secondCell?.textLabel?.text
        
        XCTAssertEqual(tableViewCellNumber, 3)
        XCTAssertEqual(firstCellLable, "apple")
        XCTAssertEqual(secondCellLable, "banana")
    }
    
    func testBlueVCShowsErrorWhenNoDataReturned() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let mvm = MockBlueScreenViewModel(fruit: [])
        let vc = VCFactory().makeBlueScreen(blueViewModel: mvm) as! BlueViewController
        
        window.rootViewController = vc
        vc.didGetError(message: "An error as occurred")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let alert = window.rootViewController?.presentedViewController as! UIAlertController
            let actionsCount = alert.actions.count
            let message = alert.message
            let title = alert.title
            let okAction = alert.actions[0].title
            
            XCTAssertNotNil(alert)
            XCTAssertEqual(actionsCount, 1)
            XCTAssertEqual(okAction, "OK")
            XCTAssertEqual(title, "Error")
            XCTAssertEqual(message, "An error as occurred")
            
            asyncExpectation.fulfill()
        })
        waitForExpectations(timeout: 1.5, handler: nil)
        
    }
    
    
    

}
