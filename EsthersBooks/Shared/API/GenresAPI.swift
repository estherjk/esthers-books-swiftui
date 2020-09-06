//
//  GenresAPI.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 9/6/20.
//

import Foundation

enum GenresStatus {
    case notProcessed, processing, fetched
}

class GenresAPI: ObservableObject {
    @Published var genresStatus = GenresStatus.notProcessed
    @Published var genres: [Genre] = []
    
    func getGenres(accessToken: String) {
        genresStatus = GenresStatus.processing
        
        guard let url = URL(string: "\(APIConstants.baseURL)/api/genres/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(accessToken)",
        ]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            // Create a custom date formatter...
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
            
            // And use it to decode the dates
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            if let genres = try? decoder.decode([Genre].self, from: data) {
                DispatchQueue.main.async {
                    self.genresStatus = GenresStatus.fetched
                    self.genres = genres.sorted { $0.url < $1.url }
                }
            }
        }
        .resume()
    }
}
