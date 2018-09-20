//
//  IexEndPoint.swift
//  MRKT
//
//  Created by Afiq Ramli on 13/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

/// Endpoint for stock data resources from iextrading.com

public enum IexApi {
    case marketNews(symbol: String)
    case stockNews(symbol: String)
    case stocksSummary
}

extension IexApi: EndPointType {
    
//    var environmentBaseURL: String {
//    }
    
    var baseUrl: URL {
        let urlString = "https://api.iextrading.com/1.0/"
        guard let url = URL(string: urlString) else { fatalError("baseURL could not be configured")}
        return url
    }
    
    var path: String {
        
        switch self {
        case .marketNews(let symbol):
            return "stock/\(symbol)/news"
        case .stockNews(let symbol):
            return "stock/\(symbol)/news"
        case .stocksSummary:
            return "stock/market/list/gainers" // can be wither losers/ mostactive
        }
        
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .marketNews:
            return .requestParameters(bodyParameters: nil, urlParameters: nil)
        case .stockNews:
            return .requestParameters(bodyParameters: nil, urlParameters: nil)
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}

