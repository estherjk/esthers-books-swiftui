//
//  Home.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        BookList(books: sampleBooksData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
