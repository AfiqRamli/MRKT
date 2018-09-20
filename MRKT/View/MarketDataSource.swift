//
//  StocksDataSource.swift
//  MRKT
//
//  Created by Afiq Ramli on 18/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

class MarketDataSource: NSObject, UITableViewDataSource {
    
    var stockList: [Stock]?
    let identifier = MarketTableViewCell.defaultReuseIdentifier
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MarketTableViewCell
        // configure news into cell
        cell.stock = stockList?[indexPath.row]
        return cell
    }
    
    
}
