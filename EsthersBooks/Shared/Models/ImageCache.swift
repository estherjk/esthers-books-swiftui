//
//  ImageCache.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/17/20.
//

import Foundation
import UIKit

// See https://medium.com/macoclock/remote-image-url-with-caching-in-swiftui-611f17cbd985
class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, uiImage: UIImage) {
        cache.setObject(uiImage, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    
    static func getImageCache() -> ImageCache {
        imageCache.cache.countLimit = 40
        imageCache.cache.totalCostLimit = 50_000_000  
        
        return imageCache
    }
}
