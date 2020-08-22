//
//  EsthersBooksApp.swift
//  Shared
//
//  Created by Esther Kim on 7/29/20.
//

import SwiftUI

@main
struct EsthersBooksApp: App {
    @StateObject var tokenRepository = TokenRepository()
    @StateObject var booksAPI = BooksAPI()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(tokenRepository)
                .environmentObject(booksAPI)
        }
    }
}
