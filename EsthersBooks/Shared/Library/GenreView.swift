//
//  GenreList.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 9/6/20.
//

import SwiftUI

struct GenreView: View {
    var genres: [Genre]
    var books: [Book]
    
    let rows = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Genres")
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    // ForEach works with identifiable data. Pass trello_id since this is unique.
                    ForEach(genres, id: \.trello_id) { genre in
                        NavigationLink(destination: BookGrid(books: books.filter({
                            $0.genres.contains(genre.trello_id)
                        }), navBarTitle: genre.name)) {
                            GenreItem(genre: genre)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct GenreItem: View {
    var genre: Genre
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(genre.name)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            
            Divider()
        }
        .frame(width: 300)
        .padding()
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genres: sampleGenresData, books: sampleBooksData)
    }
}
