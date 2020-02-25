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
    
    public var yellowVC: UIViewController?
    public var yellowScreenVM: YellowScreenViewModelProtocol?
    
    public var blueVC: UIViewController?
    
    public required init(vcFactory: VCFactoryProtocol, vmFactory: VMFactoryProtocol, window: UIWindow) {
        self.vcFactory = vcFactory
        self.vmFactory = vmFactory
        
        self.window = window
        self.showYellowScreen()
    }
    
    public func showYellowScreen() {
        self.vmFactory.appCoordinator = self
        yellowScreenVM = vmFactory.makeYellowScreenViewModel()
        if let vmScreen = yellowScreenVM {
            yellowVC = vcFactory.makeYellowScreen(yellowViewModel: vmScreen)
            window.rootViewController = yellowVC
        }
    }
    
    public func showBlueScreen() {
        blueVC = vcFactory.makeBlueScreen()
        window.rootViewController = blueVC
    }
}
