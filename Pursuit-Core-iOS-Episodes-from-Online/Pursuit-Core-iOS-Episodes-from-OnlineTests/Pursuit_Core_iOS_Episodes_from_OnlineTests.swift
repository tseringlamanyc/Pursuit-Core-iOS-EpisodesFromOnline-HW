//
//  Pursuit_Core_iOS_Episodes_from_OnlineTests.swift
//  Pursuit-Core-iOS-Episodes-from-OnlineTests
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import Pursuit_Core_iOS_Episodes_from_Online

class Pursuit_Core_iOS_Episodes_from_OnlineTests: XCTestCase {
    
    func testDataCount() {
        // arrange
        // url friendly string
        let searchQuery = "bad".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let exp = XCTestExpectation(description: "search found")
        let showEndpointURL = "https://api.tvmaze.com/search/shows?q=\(searchQuery)"
        
        _ = URLRequest(url: URL(string: showEndpointURL)!)
        
        // act
        NetworkHelper.shared.performDataTask(userurl: showEndpointURL) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("\(appError)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 140000)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    

}
