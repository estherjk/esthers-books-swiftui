//
//  BookList.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookList: View {
    var body: some View {
        NavigationView {
            // Lists work with identifiable data. Pass trello_id since this is unique.
            List(sampleBooksData, id: \.trello_id) { book in
                NavigationLink(destination: BookDetail(book: book)) {
                    BookRow(book: book)
                }
            }
            .navigationBarTitle(Text("Books"))
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
