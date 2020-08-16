//
//  HomeView.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tokenAPI: TokenAPI
    @EnvironmentObject var booksAPI: BooksAPI
    
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
        }
        .onAppear(perform: {
            booksAPI.getBooks(accessToken: tokenAPI.token!.access)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
