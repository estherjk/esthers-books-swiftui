//
//  BookRow.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookCard: View {
    let book: Book
    
    var body: some View {
        HStack {
            BookCardThumbnail(imageURL: book.cover_attachment.url)
            
            Text(book.title)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

struct BookCardThumbnail: View {
    let imageURL: String
    
    var body: some View {
        CoverImageView(imageURL: imageURL)
            .frame(width: 50)
            .shadow(radius: 2)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: sampleBooksData[4])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
