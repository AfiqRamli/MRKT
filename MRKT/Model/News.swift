//
//  News.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation

struct News: Decodable {
    
    var headline: String?
    var category: String?
    var summary: String?
    var datetime: String?
    var source: String? // news source . MUST ATTRIBUTE
    var url: String? // url to news site
    var image: String? // url to remote image
    
}
