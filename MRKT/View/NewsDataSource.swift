//
//  NewsDataSource.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource {
    
    var newsList: [News]?
    let identifier = NewsTableViewCell.defaultReuseIdentifier
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NewsTableViewCell
        // configure news into cell
        cell.news = newsList?[indexPath.row]
        return cell
    }
}

// Create shared tableview class for stock prices tableview + protocols to implement
// Setup news cell view
// Configure networking with RESTAPI
// 
