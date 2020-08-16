//
//  ImageLoader.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/16/20.
//

import SwiftUI

import SwiftUI

class ImageLoader : ObservableObject {
    @Published var data: Data?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}
