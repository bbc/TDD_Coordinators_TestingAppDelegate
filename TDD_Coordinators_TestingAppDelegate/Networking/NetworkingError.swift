//
//  NetworkingError.swift
//  TDD_Coordinators_TestingAppDelegate
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case dataNotFound
    case noInternetConnection
    case dataDecodingError
    
    var caseId: String {
        switch self {
        case .dataNotFound:
            return "noData"
        case .noInternetConnection:
            return "noInternet"
        case .dataDecodingError:
            return "wrongDataType"
        }
    }
}
