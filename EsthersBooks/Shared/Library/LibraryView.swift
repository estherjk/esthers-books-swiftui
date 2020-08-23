//
//  LibraryView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/2/20.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var booksAPI: BooksAPI
    
    private let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        if booksAPI.booksStatus == BooksStatus.fetched {
            NavigationView {
                List {
                    ThisYearView(books: booksAPI.booksByYear[currentYear] ?? [])
                        .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                    
                    YearlySummaryView(booksByYear: booksAPI.booksByYear)
                        .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                }
                .navigationTitle("Library")
             }
             .navigationViewStyle(StackNavigationViewStyle())
        }
        else {
            ProgressView {
                Text("Loading...")
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(BooksAPI())
    }
}
