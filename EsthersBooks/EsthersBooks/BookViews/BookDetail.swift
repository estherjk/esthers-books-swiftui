//
//  BookDetail.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    var book: Book
    
    var body: some View {
        // TODO: Replace hard-coded data
        VStack {
            CoverImage(image: book.image)
            
            Text(book.title)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
            
            Spacer()
                .frame(height: 10)
            
            // TODO: Display human-friendly date formats
            Text("\(book.date_started) to \(book.date_finished)")
            
            Spacer()
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: sampleBooksData[4])
    }
}
