//
//  BookList.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookList: View {
    var books: [Book] = []
    var navBarTitle = "Books"
    
    var body: some View {
        List {
            HStack() {
                Spacer()
                Text(books.count == 1 ? "\(books.count) Book" : "\(books.count) Books")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            
            // ForEach works with identifiable data. Pass trello_id since this is unique.
            ForEach(books, id: \.trello_id) { book in
                NavigationLink(destination: BookDetail(book: book)) {
                    BookCard(book: book)
                }
            }
        }
        .navigationTitle(navBarTitle)
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(books: sampleBooksData)
    }
}
