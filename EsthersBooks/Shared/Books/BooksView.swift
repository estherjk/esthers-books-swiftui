//
//  BooksView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/4/20.
//

import SwiftUI

struct BooksView: View {
    var body: some View {
        NavigationView {
            BookList(books: sampleBooksData)
            
            Text("Select a book")
                .font(.largeTitle)
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
