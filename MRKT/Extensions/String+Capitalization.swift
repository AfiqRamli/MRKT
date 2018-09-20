//
//  String+Capitalization.swift
//  MRKT
//
//  Created by Afiq Ramli on 12/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation
import UIKit

// extension to capitalized first letter

extension String {
    
//    func capitalizedFirst() -> String {
//        let first = self[self.startIndex ..< self.index(startIndex, offsetBy: 1)]
//        let rest = self[self.index(startIndex, offsetBy: 1) ..< self.endIndex]
//        return first.uppercased() + rest.lowercased()
//    }
//
//    func capitalizedFirst(with: Locale?) -> String {
//        let first = self[self.startIndex ..< self.index(startIndex, offsetBy: 1)]
//        let rest = self[self.index(startIndex, offsetBy: 1) ..< self.endIndex]
//        return first.uppercased(with: with) + rest.lowercased(with: with)
//    }
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
    
}

