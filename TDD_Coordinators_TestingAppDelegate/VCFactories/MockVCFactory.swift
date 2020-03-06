//
//  MockVCFactory.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class MockVCFactory: VCFactoryProtocol {
            
    var yellowVM: YellowScreenViewModelProtocol?
    
    func makeYellowScreen(yellowViewModel: YellowScreenViewModelProtocol) -> UIViewController {
        self.yellowVM = yellowViewModel
        return ViewControllerWithTag()
    }
    
    func makeBlueScreen(blueViewModel: BlueScreenViewModelProtocol) -> UIViewController {
        return ViewControllerWithOtherTag()
    }
}

class ViewControllerWithTag : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 11
    }
}

class ViewControllerWithOtherTag : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 12
    }
}
