//
//  MockBlueViewController.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Sabrina Tardio on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockBlueViewController: BlueViewControllerProtocol {
    
    var blueVM: BlueScreenViewModelProtocol?
    var didGetDataWasCalled = false
    var didGetErrorWasCalled = false
    var errorMessage = ""
    
    func didGetData() {
        self.didGetDataWasCalled = true
    }
    
    func didGetError(message: String) {
        self.didGetErrorWasCalled = true
        self.errorMessage = message
     }
    
}
