//
//  MockNetworking.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockNetworking: NetworkProtocol {
    
    var testURLs = [URL?: (Data?, Error?)]()
    
    func get(url: URL, completion: @escaping (Data?, NetworkingError?) -> Void) {
        completion(testURLs[url]?.0, testURLs[url]?.1 as? NetworkingError)
    }
}
