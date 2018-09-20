//
//  NetworkManager.swift
//  MRKT
//
//  Created by Afiq Ramli on 13/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticate first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "Could not decode the response obtained."
}

enum Result<String> {
    case success
    case failure(String)
}


struct NetworkManager {
    
    static let environment: NetworkEnvironment = .production
    static let APIKey = "YOUR_API_KEY"
    private let router = Router<IexApi>()

    //MARK: - Get news from remnote api
    func getNewsFeed(symbol: String, completion: @escaping (_ news: [News]?,_ error: String?) -> ()) {
        
        router.request(.marketNews(symbol: symbol)) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                NetworkLogger.log(response: response)
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode([News].self, from: responseData)
                        DispatchQueue.main.async {
                            completion(apiResponse, nil)
                        }
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    //MARK: - Get stock quotes from remote api
    func getStocksSummary(completion: @escaping (_ news: [Stock]?,_ error: String?) -> ()) {
        router.request(.stocksSummary) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                NetworkLogger.log(response: response)
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode([Stock].self, from: responseData)
                        DispatchQueue.main.async {
                            completion(apiResponse, nil)
                        }
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
            
            
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)  
        }
    }
    
}





















