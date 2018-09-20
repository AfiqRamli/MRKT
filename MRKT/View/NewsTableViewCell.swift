//
//  NewsTableViewCell.swift
//  MRKT
//
//  Created by Afiq Ramli on 11/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell{
    
    var news: News? {
        didSet {
            if let newsHeadline = news?.headline,
                let newsSource = news?.source,
                let newsDate = news?.datetime {
                
                setupThumbnailImage()
                headlineLabel.text = newsHeadline
                sourceLabel.text = newsSource
                dateLabel.text = reformatDate(newsDate)
            }
        }
    }
    
    let bookmarkButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        // Image
        return btn
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "14/09/2018"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(hex: 0x222222, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.text = "business insider".capitalizeFirstLetter()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(hex: 0x222222, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headlineLabel: UILabel = {
        let label = UILabel()
        label.text = "News Title Here about the stock markets."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thumbnailImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
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
        
        self.addSubview(headlineLabel)
        self.addSubview(sourceLabel)
        self.addSubview(dateLabel)
        self.addSubview(thumbnailImageView)
        
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headlineLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            headlineLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.70),
            headlineLabel.heightAnchor.constraint(equalToConstant: 70)
            ])
        
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 5),
            sourceLabel.leftAnchor.constraint(equalTo: headlineLabel.leftAnchor),
            sourceLabel.widthAnchor.constraint(equalTo: headlineLabel.widthAnchor, multiplier: 0.5),
            sourceLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 5),
            dateLabel.leftAnchor.constraint(equalTo: headlineLabel.leftAnchor),
            dateLabel.widthAnchor.constraint(equalTo: sourceLabel.widthAnchor)
            ])
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: headlineLabel.topAnchor, constant: 15),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 80),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 80),
            thumbnailImageView.leftAnchor.constraint(equalTo: headlineLabel.rightAnchor)
            ])
        
    }
    
    private func reformatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxx"
        
        let newFormat = DateFormatter()
        newFormat.dateFormat = "MMM dd"

        if let date = dateFormatter.date(from: dateString) {
            return newFormat.string(from: date)
        } else {
            return "nil"
        }
    }
    
    private func setupThumbnailImage() {
        guard let imageUrl = news?.image else { return }
        print(imageUrl)
        thumbnailImageView.loadImageUsingUrl(urlString: imageUrl)
    }
    
}

extension NewsTableViewCell: ReusableCellView {}










