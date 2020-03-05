//
//  YellowScreenViewModel.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class YellowScreenViewModel: YellowScreenViewModelProtocol {
    
    var appCoordinator: AppCoordinatorProtocol?
    
    func launchBlueScreen() {
        if let appCoordinator = appCoordinator{
            appCoordinator.showBlueScreen()
        }
    }
    
}
