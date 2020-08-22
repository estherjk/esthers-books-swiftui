//
//  TokenStore.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 8/20/20.
//

import SwiftUI
import KeychainAccess

class TokenStore {
    let keychain = Keychain(service: "tech.esthermakes.EsthersBooks.TokenStore")
    
    private struct Keys {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }
    
    func saveAccessToken(tokenString: String) {
        keychain[Keys.accessToken] = tokenString
    }
    
    func getAccessToken() -> String? {
        return keychain[Keys.accessToken]
    }
    
    func saveRefreshToken(tokenString: String) {
        keychain[Keys.refreshToken] = tokenString
    }
    
    func getRefreshToken() -> String? {
        return keychain[Keys.refreshToken]
    }
}
