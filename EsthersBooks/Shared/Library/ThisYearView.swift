//
//  ThisYearRow.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/1/20.
//

import SwiftUI

struct ThisYearView: View {
    var books: [Book]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("This Year")
                .font(.title)
                .padding(.leading)
            
            Text("\(books.count) Books")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(books, id: \.trello_id) { book in
                        NavigationLink(destination: BookDetail(book: book)) {
                            BookThumbnail(imageURL: book.cover_attachment.url)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct BookThumbnail: View {
    let imageURL: String
    
    var body: some View {
        CoverImageView(imageURL: imageURL)
            .frame(height: 150)
            .shadow(radius: 5)
    }
}

struct ThisYearView_Previews: PreviewProvider {
    static var previews: some View {
        ThisYearView(books: sampleBooksData)
    }
}
