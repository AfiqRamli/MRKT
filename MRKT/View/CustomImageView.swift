//
//  CustomImageView.swift
//  MRKT
//
//  Created by Afiq Ramli on 18/09/2018.
//  Copyright © 2018 Afiq Ramli. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrl(urlString: String) {
        
        imageUrlString = urlString
        guard let imageUrl = URL(string: urlString) else { return }
        
        self.image = nil
        
        if let imageFromCache = imageCache.object(forKey: imageUrl.absoluteString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            
            if let error = error {
                print("Error downloading images \(error.localizedDescription)")
                return
            } else if let data = data, let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    let imageToCache = image
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    
                    imageCache.setObject(imageToCache, forKey: imageUrl.absoluteString as NSString)
                    print("Loaded")
                }
            }
            
            }.resume()
        
    }
}
