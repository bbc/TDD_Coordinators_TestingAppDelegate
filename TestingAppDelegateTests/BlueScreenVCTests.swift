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
    
    
    
//
//    func testWhenBlueScreenIsDisplayedItIsADelegateOfTheVM() {
//        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
//        
//        // need to create a VM and a VC
//        let blueVM =
//        
//        self.vmFactory.appCoordinator = self
//        blueScreenVM = vmFactory.makeBlueScreenViewModel()
//        if let  vmScreen = blueScreenVM {
//            blueVC = vcFactory.makeBlueScreen(blueViewModel: vmScreen)
//            window.rootViewController = blueVC
//        }
//        
//        
//        
//        
//        let mockDataService = MockDataService(fruitList: nil, error: nil)
//        let appCoordinator = AppCoordinator(vcFactory: MockVCFactory(), vmFactory: MockVMFactory(dataService: mockDataService), window: window)
//        
//        appCoordinator.showBlueScreen()
//        
//        XCTAssertNotNil(appCoordinator.blueVC)
//        XCTAssertNotNil(window.viewWithTag(2))
//    }
//
}
