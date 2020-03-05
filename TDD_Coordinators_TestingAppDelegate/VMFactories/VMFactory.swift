//
//  VMFactory.swift
//  TDD_Coordinators
//
//  Created by Sabrina Tardio on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class VMFactory: VMFactoryProtocol {
    
    var appCoordinator: AppCoordinatorProtocol?
        
    func makeYellowScreenViewModel() -> YellowScreenViewModelProtocol {
        let yellowScreenVM = YellowScreenViewModel()
        yellowScreenVM.appCoordinator = self.appCoordinator
        return yellowScreenVM
    }
    
    func makeBlueScreenViewModel() -> BlueScreenViewModelProtocol {
        guard let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json") else {fatalError()}
        let blueScreenVm = BlueScreenViewModel(dataService: DataService(networking: Networking(), fruitUrl: url))
        return blueScreenVm
    }
    
    
}
