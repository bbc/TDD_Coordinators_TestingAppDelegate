//
//  BlueScreenViewModel.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class BlueScreenViewModel: BlueScreenViewModelProtocol {
    var numberOfSections = 1
    var fruitList: [Fruit]?
    var dataService: DataServiceProtocol?
    var error: Error?
    weak var delegate: BlueScreenViewModelDelegate?
    
    init(dataService: DataServiceProtocol?) {
        self.dataService = dataService
        // should we have a capture list here?
        dataService?.fetchFruits(completion: { (fruitList, error) in
            if let error = error {
                self.error = error
                print(error)
                self.delegate?.didGetError(message: "An error has occurred")
            } else {
                if let fruitList = fruitList {
                    self.fruitList = fruitList
                    self.delegate?.didGetData()
                }
            }
        })
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

protocol BlueScreenViewModelDelegate: class {
    func didGetData()
    func didGetError(message: String)
}
