//
//  UIColor+HexConversion.swift
//  MRKT
//
//  Created by Afiq Ramli on 12/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    public convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
}

// How to use:
// let color = UIColor(hex: 0xAABBCC)
