//
//  RouterTests.swift
//  MRKTTests
//
//  Created by Afiq Ramli on 20/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import XCTest
@testable import MRKT

class RouterTests: XCTestCase {
    
    var subject: Router<IexApi>!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        subject = Router<IexApi>(session: self.session)
    }
    
    func test_GET_RequestsTheURL() {
        let url = URL(string: "https://api.iextrading.com/1.0/stock/market/news")!
        
        subject.request(.marketNews(symbol: "market")) { (_, _, _) in
            
        }
        
        XCTAssert(session.lastURL == url)
    }
    
}
