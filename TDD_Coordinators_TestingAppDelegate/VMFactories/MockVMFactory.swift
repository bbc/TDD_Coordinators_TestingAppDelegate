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
        let yellowScreenVM = YellowScreenViewModel()
        yellowScreenVM.appCoordinator = self.appCoordinator
        return yellowScreenVM
    }
    
    func makeBlueScreenViewModel() -> BlueScreenViewModelProtocol {
        guard let url = URL(string: "") else {fatalError()}
        let blueScreenVm = BlueScreenViewModel(dataService: DataService(networking: Networking(), fruitUrl: url))
        return blueScreenVm
    }
}

