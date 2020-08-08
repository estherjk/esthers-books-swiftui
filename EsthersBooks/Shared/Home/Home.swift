//
//  Home.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        // TODO: Figure out best layout for macOS
        HomeTabView()
    }
}

struct HomeTabView: View {
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
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
