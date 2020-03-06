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
        let vc = ViewControllerWithTag()
        vc.tag = ViewTag.yellowVc.rawValue
        return vc
    }
    
    func makeBlueScreen(blueViewModel: BlueScreenViewModelProtocol) -> UIViewController {
        let vc = ViewControllerWithTag()
        vc.tag = ViewTag.blueVc.rawValue
        return vc
    }
}

class ViewControllerWithTag : UIViewController {
    var tag: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = self.tag
    }
}


