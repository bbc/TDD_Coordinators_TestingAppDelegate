//
//  BlueScreenViewModel.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class BlueScreenViewModel {
    var numberOfSections = 1
    var fruitList: [Fruit]? = nil
    var dataService: DataServiceProtocol?
    
    init(dataService: DataServiceProtocol?) {
        self.dataService = dataService
        fruitList = dataService?.getFruit()
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        guard section == 0 else {return 0}
        guard fruitList != nil else {return 0}
        return fruitList!.count
    }
    
    func string(forRow row: Int, inSection section: Int) -> String? {
        guard section == 0 else {return .none}
        guard fruitList != nil else {return .none}
        guard row >= 0, fruitList!.count > row else {return .none}
        return fruitList![row].type
    }
}
