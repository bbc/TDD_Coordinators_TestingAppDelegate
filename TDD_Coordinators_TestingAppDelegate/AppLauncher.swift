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
        guard let fruitUrl = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json") else {return}
        let networking = Networking()
        let dataService = DataService(networking: networking, fruitUrl: fruitUrl)
        _ = AppCoordinator(vcFactory: VCFactory(), vmFactory: VMFactory(dataService: dataService), window: self.window)
    }
}
