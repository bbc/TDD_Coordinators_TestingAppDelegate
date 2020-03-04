//
//  NetworkService_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class NetworkService_Tests: XCTestCase {
    
    class NetworkService: NetworkProtocol {
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
    
    func testWhenGetRequestIsMadeToAURLDataIsReturned(){
        // Given
       let expectation = XCTestExpectation(description: "Download fruit Data")

        let networkService = NetworkService()
        let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json")
        // When
        networkService.get(url: url!) { data, error  in
        // Then
            XCTAssertNotNil(data, "No data retrieved")
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    func testWhenGetRequestIsMadeToWrongURLErrorIsREturned(){
        
       let expectation = XCTestExpectation(description: "Download fruit Data")

        let networkService = NetworkService()
        let url = URL(string: "htps://raw.githubusercontent.com/fmtvp/recruit-test-data/master")
        
        networkService.get(url: url!) { data, error  in
            XCTAssertNil(data, "No data retrieved")
            XCTAssertNotNil(error)
            XCTAssertEqual("noInternet", error?.caseId)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
    }
    
}
