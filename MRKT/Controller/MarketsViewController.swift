//
//  MarketsViewController.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation
import UIKit

class MarketsViewController: UITableViewController {
    
    var networkManager = NetworkManager()
    var stockListSource = MarketDataSource()
    let identifier = MarketTableViewCell.defaultReuseIdentifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        fetchMarketsData()
    }
    
    private func configureSubviews() {
        self.view.backgroundColor = .white
        self.title = "Market"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self.stockListSource
    }
    
    private func fetchMarketsData() {
        ApiService.shared.getStocksList { (stocks) in
            self.stockListSource.stockList = stocks
            self.tableView.reloadData()
        }
    }
    
}

extension MarketsViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
