//
//  WatchlistViewController.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation
import UIKit

class WatchlistViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    private func configureSubviews() {
        self.view.backgroundColor = .white
        self.title = "Watchlist"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
