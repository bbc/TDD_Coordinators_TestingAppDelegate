//
//  DataService.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class DataService {
    
    var networking: NetworkProtocol
    var fruitUrl: URL
    
    init(networking: NetworkProtocol, fruitUrl: URL) {
        self.networking = networking
        self.fruitUrl = fruitUrl
    }
    
    func fetchFruits(completion: @escaping (_ fruits: [Fruit]?, _ error: NetworkingError?) -> Void) {
        networking.get(url: fruitUrl) { (data, networkingError) in
            if let error = networkingError {
                completion(nil, error)
            } else {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let fruitList = try decoder.decode([Fruit].self, from: data)
                        completion(fruitList, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkingError.dataDecodingError)
                    }
                }
            }
        }
    }
    
    
}
