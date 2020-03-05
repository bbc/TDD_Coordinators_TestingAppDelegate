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
    
    var completionHandler: (([Fruit]?, NetworkingError?) -> Void)?
    
    init(fruitList: [Fruit]?, error: NetworkingError?) {
        self.fruitList = fruitList
        self.error = error
    }
    
    func fetchFruits(completion: @escaping ([Fruit]?, NetworkingError?) -> Void) {
        self.completionHandler = completion
    }
    
    func performGetFruitCompletion(){
        self.completionHandler!(fruitList, error)
    }
    
    
}
