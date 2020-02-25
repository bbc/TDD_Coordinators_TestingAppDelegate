//
//  ViewController.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController, YellowViewControllerProtocol {
    
    var yellowVM: YellowScreenViewModelProtocol?
    
    @IBOutlet weak var showBlueScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.accessibilityIdentifier = "yellowVC"
        view.tag = 1
        if let blueScreenButtonLabel = showBlueScreenButton.titleLabel {
            blueScreenButtonLabel.attributedText = NSAttributedString(string: "Show Blue Screen")}
        showBlueScreenButton.accessibilityIdentifier = "Show Blue Screen"
        
    }
    
    @IBAction func showBlueScreenButtonPressed(_ sender: UIButton) {
        yellowVM?.launchBlueScreen()
    }
    
}

