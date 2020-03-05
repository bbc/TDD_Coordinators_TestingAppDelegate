//
//  MockAppCoordinator.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class MockAppCoordinator: AppCoordinatorProtocol {
    
    var vmFactory: VMFactoryProtocol
    var vcFactory: VCFactoryProtocol
    
    var blueScreenExists = false
    var blueViewModelExists = false
    
    var yellowVC: YellowViewControllerProtocol?
    var yellowScreenVM: YellowScreenViewModelProtocol?
    
    var blueVC: UIViewController?
    
    required init(vcFactory: VCFactoryProtocol, vmFactory: VMFactoryProtocol, window: UIWindow){
        self.vcFactory = vcFactory
        self.vmFactory = vmFactory

        showYellowScreen()
    }
    
    func showYellowScreen() {
        self.vmFactory.appCoordinator = self
        yellowScreenVM = vmFactory.makeYellowScreenViewModel()
        if let vmScreen = yellowScreenVM {
            yellowVC = vcFactory.makeYellowScreen(yellowViewModel: vmScreen) as? YellowViewControllerProtocol
        }
    }
    
    func showBlueScreen() {
        blueScreenExists = true
        blueViewModelExists = true
//        blueVC = vcFactory.makeBlueScreen()
    }
    
}
