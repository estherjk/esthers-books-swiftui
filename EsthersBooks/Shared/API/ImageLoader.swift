//
//  ImageLoader.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/16/20.
//

import SwiftUI

import SwiftUI

class ImageLoader : ObservableObject {
    @Published var uiImage: UIImage?
    
    private var urlString: String
    private var imageCache = ImageCache.getImageCache()
    private var imageLoadedFromCache = false
    
    init(urlString: String) {
        self.urlString = urlString
        
        loadImageFromCache()
        
        if !imageLoadedFromCache {
            loadImageFromRemote()
        }
    }
    
    private func loadImageFromCache() {
        guard let cachedUIImage = imageCache.get(forKey: urlString) else { return }
        
        print("loadImageFromCache: \(urlString)")
        uiImage = cachedUIImage
        imageLoadedFromCache = true
    }
    
    private func loadImageFromRemote() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                guard let remoteUIImage = UIImage(data: data) else { return }
                
                print("loadImageFromRemote: \(self.urlString)")
                self.imageCache.set(forKey: self.urlString, uiImage: remoteUIImage)
                self.uiImage = remoteUIImage
            }
        }
        .resume()
    }
}
