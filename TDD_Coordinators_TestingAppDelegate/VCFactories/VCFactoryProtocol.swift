//
//  VCFactoryProtocol.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

protocol VCFactoryProtocol {
        
    func makeYellowScreen(yellowViewModel: YellowScreenViewModelProtocol) -> UIViewController
    
    func makeBlueScreen(blueViewModel: BlueScreenViewModelProtocol) -> UIViewController

}
