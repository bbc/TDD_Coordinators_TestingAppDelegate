//
//  MockAppCoordinator.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

public class MockAppCoordinator: AppCoordinatorProtocol {
    
    var vmFactory: VMFactoryProtocol
    var vcFactory: VCFactoryProtocol
    
    public var blueScreenExists = false
    public var blueViewModelExists = false
    
    public var yellowVC: YellowViewControllerProtocol?
    public var yellowScreenVM: YellowScreenViewModelProtocol?
    
    public var blueVC: UIViewController?
    
    required public init(vcFactory: VCFactoryProtocol, vmFactory: VMFactoryProtocol, window: UIWindow) {
        self.vcFactory = vcFactory
        self.vmFactory = vmFactory
        showYellowScreen()
    }
    
    
    public func showBlueScreen() {
        blueScreenExists = true
        blueViewModelExists = true
        blueVC = vcFactory.makeBlueScreen()
    }
    public func showYellowScreen() {
        self.vmFactory.appCoordinator = self
        yellowScreenVM = vmFactory.makeYellowScreenViewModel()
        if let vmScreen = yellowScreenVM {
            yellowVC = vcFactory.makeYellowScreen(yellowViewModel: vmScreen) as? YellowViewControllerProtocol
        }
    }
    
}
