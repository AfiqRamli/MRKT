//
//  ViewController.swift
//  MRKT
//
//  Created by Afiq Ramli on 04/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureSubviews()
    }
    
    private func configureSubviews() {
        
        let newsTab = NewsViewController()
        let newsIcon: UIImage = #imageLiteral(resourceName: "news_icon").withRenderingMode(.alwaysTemplate)
        let newsTabBarItem = UITabBarItem(title: "News", image: newsIcon, selectedImage: newsIcon)
        newsTab.tabBarItem = newsTabBarItem
        
        
        let marketsTab = MarketsViewController()
        let marketsIcon: UIImage = #imageLiteral(resourceName: "market_icon").withRenderingMode(.alwaysTemplate)
        let marketsTabItem = UITabBarItem(title: "Markets", image: marketsIcon, selectedImage: marketsIcon)
        marketsTab.tabBarItem = marketsTabItem
        
        
        let watchlistTab = WatchlistViewController()
        let watchlistIcon: UIImage = #imageLiteral(resourceName: "watchlist_icon").withRenderingMode(.alwaysTemplate)
        let watchlistTabItem = UITabBarItem(title: "Watchlist", image: watchlistIcon, selectedImage: watchlistIcon)
        watchlistTab.tabBarItem = watchlistTabItem
        
        let controllers = [newsTab, marketsTab, watchlistTab]
        
        self.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let title = viewController.navigationController?.navigationItem.title {
            print("Selected Tab: \(title)")
        }
    }
    
}











