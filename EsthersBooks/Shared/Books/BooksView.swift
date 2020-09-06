//
//  BooksView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/4/20.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var booksAPI: BooksAPI
    
    var body: some View {
        NavigationView {
            BookList(books: booksAPI.books)
            
//            Text("Select a book")
//                .font(.largeTitle)
        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
