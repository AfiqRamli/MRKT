//
//  NewsViewController.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UITableViewController {
    
    var networkManager = NetworkManager()
    var newsSource = NewsDataSource()
    let identifier = NewsTableViewCell.defaultReuseIdentifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchMarketNews()
    }
    
    private func configureView() {
        self.view.backgroundColor = .white
        self.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self.newsSource
    }
    
    private func fetchMarketNews() {
        ApiService.shared.getNewsFeed(fromSymbol: "market") { (newsList) in
            self.newsSource.newsList = newsList
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - UITableViewDelegate methods

extension NewsViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
