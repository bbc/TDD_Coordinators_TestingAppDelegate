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
    
    init(fruitList: [Fruit]?) {
        self.fruitList = fruitList
    }
    
    func getFruit() -> [Fruit]? {
        return self.fruitList
    }
    
    
}
