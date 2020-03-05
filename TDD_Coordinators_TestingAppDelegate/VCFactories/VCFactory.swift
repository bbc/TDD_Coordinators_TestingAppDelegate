//
//  VCFactory.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class VCFactory: VCFactoryProtocol {
        
    func makeYellowScreen(yellowViewModel: YellowScreenViewModelProtocol) -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle(for: type(of: self)))
        let yellowViewController = storyboard.instantiateViewController(identifier: "YellowViewController") as! YellowViewController
        yellowViewController.yellowVM = yellowViewModel
        return yellowViewController
    }
    
    func makeBlueScreen(blueViewModel: BlueScreenViewModelProtocol) -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle(for: type(of: self)))
        let blueViewController = storyboard.instantiateViewController(identifier: "BlueViewController") as! BlueViewController
        blueViewController.blueVM = blueViewModel
        return blueViewController
    }
    
    
}
