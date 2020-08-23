//
//  BookGrid.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/23/20.
//

import SwiftUI

struct BookGrid: View {
    var books: [Book] = []
    var navBarTitle = "Books"
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 40)
    ]
    
    var body: some View {
        ScrollView {
            Text("\(books.count) Books")
                .foregroundColor(.secondary)
            
            LazyVGrid(columns: columns, spacing: 40) {
                // ForEach works with identifiable data. Pass trello_id since this is unique.
                ForEach(books, id: \.trello_id) { book in
                    NavigationLink(destination: BookDetail(book: book)) {
                        BookGridItem(book: book)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(navBarTitle)
    }
}

struct BookGridItem: View {
    let book: Book
    
    var body: some View {
        CoverImageView(imageURL: book.cover_attachment.url)
            .shadow(radius: 5)
    }
}

struct BookGrid_Previews: PreviewProvider {
    static var previews: some View {
        BookGrid(books: sampleBooksData)
    }
}
