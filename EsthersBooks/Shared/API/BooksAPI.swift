//
//  BooksAPI.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/16/20.
//

import SwiftUI

class BooksAPI: ObservableObject {
    @Published var books: [Book] = []
    @Published var booksByYear = [Int: [Book]]()
    
    func getBooks(accessToken: String) {
        guard let url = URL(string: "\(APIConstants.baseURL)/api/books/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(accessToken)",
        ]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                // Use custom date decoding strategy (full ISO8601)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                if let books = try? decoder.decode([Book].self, from: data) {
                    DispatchQueue.main.async {
                        self.books = books
                        self.booksByYear = Dictionary(
                            grouping: books,
                            by: { Calendar.current.component(.year, from: $0.date_finished) }
                        )
                    }
                }
            }
        }
        .resume()
    }
}
