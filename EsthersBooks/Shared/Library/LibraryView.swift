//
//  LibraryView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/2/20.
//

import SwiftUI

struct LibraryView: View {
    private let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationView {
            List {
                // TODO: Find a solution that doesn't force unwrap
                ThisYearView(books: sampleBooksByYear[currentYear]!)
                    .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                
                YearlySummaryView()
                    .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
            
            .navigationTitle("Library")
         }
         .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
