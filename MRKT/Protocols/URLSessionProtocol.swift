//
//  URLSessionProtocol.swift
//  MRKT
//
//  Created by Afiq Ramli on 20/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    
}

protocol URLSessionDataTaskProtocol { func resume() }


// Make URLSessionConform to the protocols
extension URLSession: URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        
    }
}
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
