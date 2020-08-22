//
//  TokenAPI.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

class TokenAPI {
    private struct Endpoints {
        static let token = "/api/token/"
        static let verify = "/api/token/verify/"
    }
    
    func obtainTokenPair(with credentials: Credentials, completion: @escaping (Result<Token, NetworkError>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.token) else { return }
        
        let request = buildPOSTRequest(url: url, parameters: [
            "username": credentials.username,
            "password": credentials.password
        ])
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                if let token = try? JSONDecoder().decode(Token.self, from: data) {
                    completion(.success(token))
                }
                else {
                    completion(.failure(.failed))
                }
            }
        }
        .resume()
    }
    
    private func buildPOSTRequest(url: URL, parameters: [String: Any]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        return request
    }
}
