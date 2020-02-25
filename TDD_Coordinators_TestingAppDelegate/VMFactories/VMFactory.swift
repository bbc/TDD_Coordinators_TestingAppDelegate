//
//  VMFactory.swift
//  TDD_Coordinators
//
//  Created by Sabrina Tardio on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

public class VMFactory: VMFactoryProtocol {
    public var appCoordinator: AppCoordinatorProtocol?
    
    public init() {}
    
    public func makeYellowScreenViewModel() -> YellowScreenViewModelProtocol {
        let yellowScreenVM = YellowScreenViewModel()
        yellowScreenVM.appCoordinator = self.appCoordinator
        return yellowScreenVM
    }
    
}
