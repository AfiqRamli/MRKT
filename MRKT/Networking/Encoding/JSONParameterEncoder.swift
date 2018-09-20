//
//  JSONParameterEncoder.swift
//  MRKT
//
//  Created by Afiq Ramli on 13/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            
            // TODO: - econding using swifts Encodable protocol as well?
            
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            }
            
        } catch {
            throw NetworkError.encodingfailed
        }
    }

}
