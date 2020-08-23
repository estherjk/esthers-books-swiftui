//
//  UserAPI.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/23/20.
//

import SwiftUI

class UserAPI: ObservableObject {
    @Published var user: User?
    
    private struct Endpoints {
        static let me = "/api/users/me/"
    }
    
    func getMe(accessToken: String) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.me) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(accessToken)",
        ]
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                DispatchQueue.main.async {
                    self.user = user
                }
            }
        }
        .resume()
    }
}
