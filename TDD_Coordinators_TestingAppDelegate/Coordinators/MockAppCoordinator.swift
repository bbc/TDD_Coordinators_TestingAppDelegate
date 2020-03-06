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
    
    var blueScreenExists = false
    var blueViewModelExists = false
    
    
    func showYellowScreen() {

    }
    
    func showBlueScreen() {
        blueScreenExists = true
        blueViewModelExists = true
    }
    
}
