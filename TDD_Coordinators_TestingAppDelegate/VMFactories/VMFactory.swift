//
//  VMFactory.swift
//  TDD_Coordinators
//
//  Created by Sabrina Tardio on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class VMFactory: VMFactoryProtocol {
    
    var dataService: DataServiceProtocol
    var appCoordinator: AppCoordinatorProtocol?
    
    required init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
        
    func makeYellowScreenViewModel() -> YellowScreenViewModelProtocol {
        let yellowScreenVM = YellowScreenViewModel()
        yellowScreenVM.appCoordinator = self.appCoordinator
        return yellowScreenVM
    }
    
    func makeBlueScreenViewModel() -> BlueScreenViewModelProtocol {
        let blueScreenVm = BlueScreenViewModel(dataService: dataService)
        return blueScreenVm
    }
    
    
}
