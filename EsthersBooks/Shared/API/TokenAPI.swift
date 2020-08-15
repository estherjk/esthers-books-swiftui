//
//  TokenAPI.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

enum TokenStatus {
    case notProcessed, processing, valid, invalid
}

class TokenAPI: ObservableObject {
    @Published var tokenStatus: TokenStatus = TokenStatus.notProcessed
    @Published var token: Token?
    
    func obtainTokenPair(username: String, password: String) {
        tokenStatus = TokenStatus.processing
        
        guard let url = URL(string: "\(APIConstants.baseURL)/api/token/") else { return }
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let token = try? JSONDecoder().decode(Token.self, from: data) {
                    DispatchQueue.main.async {
                        self.tokenStatus = TokenStatus.valid
                        self.token = token
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.tokenStatus = TokenStatus.invalid
                    }
                }
            }
        }
        .resume()
    }
}
