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
            BookCardThumbnail(image: book.image)
            
            Text(book.title)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

struct BookCardThumbnail: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
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
