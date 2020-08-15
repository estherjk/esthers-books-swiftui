//
//  TokenAPI.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

class TokenAPI {
    func obtainTokenPair(username: String, password: String) {
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
                    // TODO: Use the token to make other API requests
                    print(token)
                }
                else {
                    print("obtainTokenPair error")
                }
            }
        }
        .resume()
    }
}
