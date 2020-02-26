//
//  AppLauncher.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 25/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class AppLauncher {
    
    var window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func launchApp(){
        _ = AppCoordinator(vcFactory: VCFactory(), vmFactory: VMFactory(), window: self.window)
    }
}
