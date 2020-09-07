//
//  BookDetail.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    @EnvironmentObject var genresAPI: GenresAPI
    
    // Format date inside text views
    // See https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-text-inside-text-views
    static let dateFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let book: Book
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/) {
            HStack {
                Spacer()
                
                VStack(spacing: 5) {
                    BookCover(imageURL: book.cover_attachment.url)
                        .padding(.bottom)
                    
                    Text(book.title)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Divider()
                        .frame(width: 300)
                        .padding()
                    
                    Text("Information")
                        .font(.headline)
                    
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("Date Started:")
                            Text("Date Finished:")
                        }
                        .foregroundColor(.secondary)
                        
                        VStack(alignment: .leading) {
                            Text("\(book.date_started, formatter: Self.dateFormatter)")
                            Text("\(book.date_finished, formatter: Self.dateFormatter)")
                        }
                    }
                    
                    Divider()
                        .frame(width: 300)
                        .padding()
                    
                    Text("Genres")
                        .font(.headline)
                    
                    ForEach(0 ..< book.genres.count) { index in
                        let genre = genresAPI.genres.filter({ $0.trello_id == book.genres[index] })
                        Text(genre[0].name)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct BookCover: View {
    var imageURL: String
    
    var body: some View {
        CoverImageView(imageURL: imageURL)
            .frame(height: 300)
            .shadow(radius: 10)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: sampleBooksData[4])
            .environmentObject(GenresAPI())
    }
}
