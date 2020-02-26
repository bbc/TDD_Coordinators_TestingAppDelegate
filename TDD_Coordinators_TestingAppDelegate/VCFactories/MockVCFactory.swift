//
//  MockVCFactory.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

public class MockVCFactory: VCFactoryProtocol {
    
    public init() {}
        
    public var yellowVM: YellowScreenViewModelProtocol?
    
    public func makeYellowScreen(yellowViewModel: YellowScreenViewModelProtocol) -> UIViewController {
        yellowVM = yellowViewModel
        //if we are using the storyboard here is this really a mock at all?
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle(for: type(of: self)))
        let yellowViewController = storyboard.instantiateViewController(identifier: "YellowViewController") as! YellowViewController
        yellowViewController.yellowVM = yellowViewModel
        return yellowViewController
    }
    
    public func makeBlueScreen() -> UIViewController {
        return BlueViewController()
    }
    
    
    
}

