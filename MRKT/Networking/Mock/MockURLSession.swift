//
//  MockURLSession.swift
//  MRKT
//
//  Created by Afiq Ramli on 20/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

class MockURLSession: URLSessionProtocol {
        var nextDataTask = 
    private (set) var lastURL: URL?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTask {
        lastURL = request.url!
        return URLSessionDataTask()
    }
}
