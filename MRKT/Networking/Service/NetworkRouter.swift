//
//  NetworkRouter.swift
//  MRKT
//
//  Created by Afiq Ramli on 13/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error? ) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

