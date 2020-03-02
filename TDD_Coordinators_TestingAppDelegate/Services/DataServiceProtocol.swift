//
//  DataServiceProtocol.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
    func getFruit(completion: @escaping (_ fruits: [Fruit]?, _ error: NetworkingError?) -> Void)
}
