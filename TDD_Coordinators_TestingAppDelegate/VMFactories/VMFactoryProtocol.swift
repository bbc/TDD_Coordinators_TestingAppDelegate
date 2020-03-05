//
//  ViewModelFactoryProtocol.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol VMFactoryProtocol {
    var appCoordinator: AppCoordinatorProtocol? {get set}
    
    init(dataService: DataServiceProtocol)
    
    func makeYellowScreenViewModel() -> YellowScreenViewModelProtocol
    func makeBlueScreenViewModel() -> BlueScreenViewModelProtocol
}
