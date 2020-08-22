//
//  TokenRepository.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

enum LoginStatus {
    case notProcessed, processing, valid, invalid
}

class TokenRepository: ObservableObject {
    @Published var loginStatus = LoginStatus.notProcessed
    @Published var accessToken: String?
    
    private let tokenStore = TokenStore()
    private let tokenAPI = TokenAPI()
    
    func login(with credentials: Credentials) {
        loginStatus = LoginStatus.processing
        
        tokenAPI.obtainTokenPair(with: credentials) { result in
            switch result {
            case .success(let token):
                self.loginStatus = LoginStatus.valid
                self.accessToken = token.access
            case .failure(.failed):
                self.loginStatus = LoginStatus.invalid
            }
        }
    }
}
