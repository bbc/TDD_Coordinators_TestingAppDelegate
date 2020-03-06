//
//  Networking.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Sabrina Tardio on 05/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class Networking: NetworkProtocol {
    func get(url: URL, completion: @escaping (Data?, NetworkingError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if response == nil {
                completion(nil, NetworkingError.noInternetConnection)
            }
            if let data = data {
                completion(data, nil)
            }
            if error != nil {
                completion(nil, NetworkingError.dataNotFound)
            }
        }
        dataTask.resume()
    }
}
