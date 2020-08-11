//
//  YearlySummaryView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/8/20.
//

import SwiftUI

struct YearlySummaryView: View {
    let booksByYear = sampleBooksByYear
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Yearly Summary")
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(booksByYear.keys.sorted(by: >), id: \.self) { year in
                        // TODO: Fix force unwrapping of books
                        let numBooks = booksByYear[year]!.count
                        let randomBookIndex = Int.random(in: 0 ..< numBooks)
                        
                        NavigationLink(destination: BookList(books: booksByYear[year]!, navBarTitle: String(year))) {
                            YearCard(
                                year: year,
                                numBooks: numBooks,
                                featuredBook: booksByYear[year]![randomBookIndex]
                            )
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

struct YearlySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        YearlySummaryView()
    }
}
