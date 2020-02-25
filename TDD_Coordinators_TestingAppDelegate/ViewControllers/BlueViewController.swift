//
//  BlueViewController.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.accessibilityIdentifier = "blueVC"
        
        view.tag = 2
    }
    
    
    
    
}
