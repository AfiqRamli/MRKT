//
//  ReusableCellView.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

public protocol ReusableCellView: class {
    // Get identifier from class name
    static var defaultReuseIdentifier: String { get }
}

extension ReusableCellView where Self: UIView {
    static var defaultReuseIdentifier: String {
        /// set identifier from class name
        return NSStringFromClass(self)
    }
}
