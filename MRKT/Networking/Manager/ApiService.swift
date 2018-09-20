//
//  ApiService.swift
//  MRKT
//
//  Created by Afiq Ramli on 18/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

class ApiService {
    
    typealias newsFeedCompletion = ([News]) -> ()
    typealias stocksSummaryCompletion = ([Stock]) -> ()
    
    static let shared = ApiService()
    private let networkManager = NetworkManager()
    
    func getNewsFeed(fromSymbol symbol: String, completion: @escaping newsFeedCompletion){
        networkManager.getNewsFeed(symbol: symbol) { (news, _) in
            if let newsList = news {
                completion(newsList)
            }
        }
    }
    
    func getStocksList(completion: @escaping stocksSummaryCompletion) {
        networkManager.getStocksSummary { (stocks, _) in
            if let stockList = stocks {
                completion(stockList)
            }
        }
    }
}
