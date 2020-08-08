//
//  LibraryView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/2/20.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            List {
                BookScrollView(books: sampleBooksData)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationTitle("Library")
         }
         .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
