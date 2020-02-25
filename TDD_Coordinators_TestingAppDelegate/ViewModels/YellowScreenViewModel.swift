//
//  YellowScreenViewModel.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

public class YellowScreenViewModel: YellowScreenViewModelProtocol {
    
    public init() {}
    
    public var appCoordinator: AppCoordinatorProtocol?
    
    public func launchBlueScreen() {
        if let appCoordinator = appCoordinator{
            appCoordinator.showBlueScreen()
        }
    }
    
}
