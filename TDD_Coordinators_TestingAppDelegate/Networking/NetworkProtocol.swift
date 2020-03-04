//
//  NetworkProtocol.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func get(url: URL, completion: @escaping (_ data: Data?, _ error: NetworkingError?) -> Void)
}
