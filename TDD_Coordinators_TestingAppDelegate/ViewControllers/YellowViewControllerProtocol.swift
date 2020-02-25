//
//  YellowViewControllerProtocol.swift
//  TDD_Coordinators
//
//  Created by Sabrina Tardio on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

public protocol YellowViewControllerProtocol: UIViewController{
    var yellowVM: YellowScreenViewModelProtocol? {get set}
}
