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
    var blueScreenVM: BlueScreenViewModelProtocol?
    
    var blueVC: UIViewController?
    
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
//        blueScreenVM = BlueScreenViewModel(dataService: DataService(networking: nil, fruitUrl: ""))
//        blueVC = vcFactory.makeBlueScreen(blueViewModel: blueScreenVM)
        window.rootViewController = blueVC
    }
}
