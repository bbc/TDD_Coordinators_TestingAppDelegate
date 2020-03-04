//
//  DataService_Tests.swift
//  TDD_Coordinators_TestingAppDelegateTests
//
//  Created by Sabrina Tardio on 04/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class DataService_Tests: XCTestCase {

    func testErrorIsGivenWhenFetchFruitIsCalledAndThereIsNoInternetConnection() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        //Given
        let mockNetworking = MockNetworking()
        let url = URL(string: "https://www.noInternetConnection")
        mockNetworking.testURLs = [url: (nil, NetworkingError.noInternetConnection)]
        let dataService = DataService(networking: mockNetworking, fruitUrl: url!)
        
        //When
        dataService.fetchFruits { (fruitList, error) in
            
        //Than
            XCTAssertNil(fruitList)
            XCTAssertNotNil(error)
            XCTAssertEqual("noInternet", error?.caseId)
            
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testErrorIsGivenWhenFetchFruitIsCalledAndNoDataWasRetrieved() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        //Given
        let mockNetworking = MockNetworking()
        let url = URL(string: "https://www.noDataRetrieved")
        mockNetworking.testURLs = [url: (nil, NetworkingError.dataNotFound)]
        let dataService = DataService(networking: mockNetworking, fruitUrl: url!)
        
        //When
        dataService.fetchFruits { (fruitList, error) in
            
        //Than
            XCTAssertNil(fruitList)
            XCTAssertNotNil(error)
            XCTAssertEqual("noData", error?.caseId)
            
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testFruitListIsReturnedWhenFetchFruitIsCalledAndDataWasRetrieved() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        //Given
        let mockNetworking = MockNetworking()
        let url = URL(string: "https://www.fruitDataRetrieved")
        let fruitList = [Fruit(type: "apple", price: 149, weight: 120), Fruit(type: "banana", price: 129, weight: 80)]
        let data = getTestFruitJson(fruitList: fruitList)
        mockNetworking.testURLs = [url: (Data(data!), nil)]
        let dataService = DataService(networking: mockNetworking, fruitUrl: url!)
        
        //When
        dataService.fetchFruits { (fruitList, error) in
            
        //Than
            XCTAssertNil(error)
            XCTAssertNotNil(fruitList)
            XCTAssertEqual(fruitList?[0].type, "apple")
            
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testErrorIsReturnedWhenFetchFruitIsCalledAndDataTypeIsWrong() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        //Given
        let mockNetworking = MockNetworking()
        let url = URL(string: "https://www.fruitDataRetrieved")
        let data = getTestFruitWrongJson()
        mockNetworking.testURLs = [url: (Data(data!), nil)]
        let dataService = DataService(networking: mockNetworking, fruitUrl: url!)
        
        //When
        dataService.fetchFruits { (fruitList, error) in
            
        //Than
            XCTAssertNil(fruitList)
            XCTAssertNotNil(error)
            XCTAssertEqual("wrongDataType", error?.caseId)
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testEmptyFruitListReturnedWhenFetchFruitIsCalledAndThereIsNoDataInTheServer() {
        let asyncExpectation = self.expectation(description: "Async block executed")
        //Given
        let mockNetworking = MockNetworking()
        let url = URL(string: "https://www.fruitDataRetrieved")
        let data = getTestFruitJson(fruitList: [])
        mockNetworking.testURLs = [url: (Data(data!), nil)]
        let dataService = DataService(networking: mockNetworking, fruitUrl: url!)
        
        //When
        dataService.fetchFruits { (fruitList, error) in
            
        //Than
            XCTAssertNil(error)
            XCTAssertNotNil(fruitList)
            XCTAssertTrue(fruitList?.isEmpty ?? false)
            
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
}


protocol NetworkProtocol {
    func get(url: URL, completion: @escaping (_ data: Data?, _ error: NetworkingError?) -> Void)
}

class MockNetworking: NetworkProtocol {
    
    var testURLs = [URL?: (Data?, Error?)]()
    
    func get(url: URL, completion: @escaping (Data?, NetworkingError?) -> Void) {
        completion(testURLs[url]?.0, testURLs[url]?.1 as? NetworkingError)
    }
}


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

func getTestFruitJson(fruitList: [Fruit]?) -> Data? {
    do {
        let encoder = JSONEncoder()
        let fruitJson = try encoder.encode(fruitList)
        return fruitJson
    } catch {
        print(error)
        return nil
    }
}

func getTestFruitWrongJson() -> Data? {
    let fruitList = [WrongFruit(name: "apple", price: 149, weight: 120), WrongFruit(name: "banana", price: 129, weight: 80)]
    do {
        let encoder = JSONEncoder()
        let fruitJson = try encoder.encode(fruitList)
        return fruitJson
    } catch {
        print(error)
        return nil
    }
}


struct WrongFruit : Codable {
    var name: String
    var price: Int
    var weight: Int
}
