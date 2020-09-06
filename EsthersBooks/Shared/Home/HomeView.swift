//
//  HomeView.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tokenRepository: TokenRepository
    @EnvironmentObject var booksAPI: BooksAPI
    @EnvironmentObject var genresAPI: GenresAPI
    
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            
            BooksView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Books")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
        }
        .onAppear(perform: {
            guard let accessToken = tokenRepository.accessToken else { return }
            
            booksAPI.getBooks(accessToken: accessToken)
            genresAPI.getGenres(accessToken: accessToken)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TokenRepository())
            .environmentObject(BooksAPI())
            .environmentObject(GenresAPI())
    }
}
