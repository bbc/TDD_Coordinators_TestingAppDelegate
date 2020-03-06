//
//  MockVMFactory.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockVMFactory: VMFactoryProtocol {

    var appCoordinator: AppCoordinatorProtocol?
       
    func makeYellowScreenViewModel() -> YellowScreenViewModelProtocol {
        return MockYellowScreenViewModel()
    }
    
    func makeBlueScreenViewModel() -> BlueScreenViewModelProtocol {
        return MockBlueScreenViewModel()
    }
}

class MockYellowScreenViewModel: YellowScreenViewModelProtocol {
    var appCoordinator: AppCoordinatorProtocol?
    
    func launchBlueScreen() {
    }
    
}

class MockBlueScreenViewModel: BlueScreenViewModelProtocol {
    var delegate: BlueScreenViewModelDelegate?
    
    var appCoordinator: AppCoordinatorProtocol?
    
    func launchBlueScreen() {
    }
    
}
