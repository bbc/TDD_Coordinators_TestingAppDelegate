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
        
    public var yellowScreenExists = false
    public var blueScreenExists = false
    public var yellowVM: YellowScreenViewModelProtocol?
    
    public func makeYellowScreen(yellowViewModel: YellowScreenViewModelProtocol) -> UIViewController {
        yellowScreenExists = true
        yellowVM = yellowViewModel
        return YellowViewController()
    }
    
    public func makeBlueScreen() -> UIViewController {
        blueScreenExists = true
        return BlueViewController()
    }
    
    
    
}

