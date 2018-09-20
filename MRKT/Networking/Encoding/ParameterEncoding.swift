//
//  ParameterEncoding.swift
//  MRKT
//
//  Created by Afiq Ramli on 13/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    
    case parametersNil = "Parameters were nil."
    case encodingfailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
    
}
