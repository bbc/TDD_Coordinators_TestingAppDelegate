//
//  AppCoordinator.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

//class ScreenLauncher {
//
//    func pushToScreen(viewController: UIViewController){
//        window.rootViewController = viewController
//    }
//}

public class AppCoordinator: AppCoordinatorProtocol {

    var window: UIWindow
    var vcFactory: VCFactoryProtocol
    var vmFactory: VMFactoryProtocol
    
    var yellowVC: UIViewController?
    var yellowScreenVM: YellowScreenViewModelProtocol?
    
    var blueVC: UIViewController?
    var blueScreenVM: BlueScreenViewModelProtocol?
    
    required init(vcFactory: VCFactoryProtocol, vmFactory: VMFactoryProtocol, window: UIWindow) {
        self.vcFactory = vcFactory
        self.vmFactory = vmFactory
        self.window = window
        self.showYellowScreen()
        window.makeKeyAndVisible()
    }
    
    func showYellowScreen() {
        self.vmFactory.appCoordinator = self
        yellowScreenVM = vmFactory.makeYellowScreenViewModel()
        if let vmScreen = yellowScreenVM {
            yellowVC = vcFactory.makeYellowScreen(yellowViewModel: vmScreen)
            window.rootViewController = yellowVC
        }
    }
    
    func showBlueScreen() {
        self.vmFactory.appCoordinator = self
        blueScreenVM = vmFactory.makeBlueScreenViewModel()
        if let  vmScreen = blueScreenVM {
            blueVC = vcFactory.makeBlueScreen(blueViewModel: vmScreen)
            window.rootViewController = blueVC
        }
    }
}
