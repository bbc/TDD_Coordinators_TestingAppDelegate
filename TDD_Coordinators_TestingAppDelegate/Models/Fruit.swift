//
//  Fruit.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

struct FruitList: Codable {
    let fruit: [Fruit]
}

struct Fruit : Codable{
    let type: String
    var price: Int
    var weight: Int
}
