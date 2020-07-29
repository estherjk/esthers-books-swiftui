//
//  BookRow.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    
    var body: some View {
        HStack {
            book.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .shadow(radius: 2)
            
            Text(book.title)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: sampleBooksData[4])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
