//
//  MarketTableViewCell.swift
//  MRKT
//
//  Created by Afiq Ramli on 18/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {
    
    var stock: Stock? {
        didSet {
            if let name =  stock?.symbol,
                let time = stock?.latestTime,
                let price = stock?.latestPrice {
                stockSymbolLabel.text = name
                timeLabel.text = time
                latestPriceLabel.text = price
            }
        }
    }
    
    let stockSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol".uppercased()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "10:00:00 AM"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: 0x222222, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let latestPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "1728".uppercased()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        self.addSubview(stockSymbolLabel)
//        self.addSubview(timeLabel)
//        self.addSubview(latestPriceLabel)
        
        NSLayoutConstraint.activate([
            stockSymbolLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            stockSymbolLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            stockSymbolLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
            ])
//        
//        NSLayoutConstraint.activate([
//            timeLabel.topAnchor.constraint(equalTo: stockSymbolLabel.bottomAnchor, constant: 10),
//            timeLabel.leftAnchor.constraint(equalTo: stockSymbolLabel.leftAnchor),
//            timeLabel.widthAnchor.constraint(equalTo: stockSymbolLabel.widthAnchor)
//            ])
//        
//        NSLayoutConstraint.activate([
//            latestPriceLabel.topAnchor.constraint(equalTo: stockSymbolLabel.topAnchor),
//            latestPriceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
//            latestPriceLabel.leftAnchor.constraint(equalTo: stockSymbolLabel.rightAnchor)
//            ])
    }
}

extension MarketTableViewCell: ReusableCellView {}







