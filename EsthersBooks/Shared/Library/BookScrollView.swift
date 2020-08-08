//
//  ThisYearRow.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/1/20.
//

import SwiftUI

struct BookScrollView: View {
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
                HStack(alignment: .top) {
                    ForEach(books, id: \.trello_id) { book in
                        NavigationLink(destination: BookDetail(book: book)) {
                            BookScrollViewThumbnail(image: book.image)
                        }
                    }
                }
            }
        }
    }
}

struct BookScrollViewThumbnail: View {
    let image: Image
    
    var body: some View {
        image
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 150)
            .shadow(radius: 5)
            .padding()
    }
}

struct BookScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BookScrollView(books: sampleBooksData)
    }
}
