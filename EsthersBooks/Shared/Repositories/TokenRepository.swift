//
//  TokenRepository.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

enum LoginStatus {
    case notProcessed, processing, valid, invalid, verifying
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
                
                self.tokenStore.saveAccessToken(tokenString: token.access)
                self.tokenStore.saveRefreshToken(tokenString: token.refresh)
            case .failure(.failed):
                self.loginStatus = LoginStatus.invalid
            }
        }
    }
    
    func verify() {
        loginStatus = LoginStatus.verifying
        
        guard let refreshToken = tokenStore.getRefreshToken() else {
            // Initiate login flow
            loginStatus = LoginStatus.notProcessed
            
            return
        }
        
        tokenAPI.verify(tokenString: refreshToken) { result in
            switch result {
            case .success(_):
                // TODO: Refresh access token. For now, just grab from Keychain
                self.accessToken = self.tokenStore.getAccessToken()
                
                self.loginStatus = LoginStatus.valid
            case .failure(.failed):
                // The user needs to re-login
                self.loginStatus = LoginStatus.notProcessed
            }
        }
    }
    
    func logout() {
        tokenStore.removeAccessToken()
        tokenStore.removeRefreshToken()
        
        loginStatus = LoginStatus.notProcessed
    }
}
