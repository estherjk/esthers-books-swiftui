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
    @StateObject var genresAPI = GenresAPI()
    @StateObject var userAPI = UserAPI()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(tokenRepository)
                .environmentObject(booksAPI)
                .environmentObject(genresAPI)
                .environmentObject(userAPI)
                .onAppear(perform: {
                    tokenRepository.verify()
                })
        }
    }
}
