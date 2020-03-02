//
//  MockDataService.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockDataService: DataServiceProtocol {
    
    var fruitList: [Fruit]?
    
    var error: NetworkingError?
    
    init(fruitList: [Fruit]?, error: NetworkingError?) {
        self.fruitList = fruitList
        self.error = error
    }
    
    func getFruit(completion: @escaping ([Fruit]?, NetworkingError?) -> Void) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Change `2.0` to the desired number of seconds.
//            // Code you want to be delayed
//            completion(self.fruitList, self.error)
//        }
                completion(self.fruitList, self.error)
        
    }
    
    
    
}
