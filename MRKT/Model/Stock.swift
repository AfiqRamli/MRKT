//
//  Stock.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    var companyName: String?
    var symbol: String?
    var sector: String?
    var latestTime: String?
    var latestPrice: String?
}
