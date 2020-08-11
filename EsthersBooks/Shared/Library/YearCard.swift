//
//  YearCard.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/8/20.
//

import SwiftUI

struct YearCard: View {
    let year: Int
    let numBooks: Int
    let featuredBook: Book
    
    var body: some View {
        let backgroundColor = Color(hex: featuredBook.cover_attachment.edgeColor)
        
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: 300, height: 150)
                
                featuredBook.image
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .shadow(radius: 2)
                    .rotationEffect(.degrees(25))
                    .offset(x: 25)
            }
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                Text(String(year))
                    .font(.headline)
                
                Text("\(numBooks) Books")
                    .font(.subheadline)
            }
            .foregroundColor(backgroundColor.readableForegroundColor())
            .padding()
        }
    }
}

struct YearCard_Previews: PreviewProvider {
    static var previews: some View {
        YearCard(
            year: 2020,
            numBooks: sampleBooksByYear[2020]!.count,
            featuredBook: sampleBooksByYear[2020]![0]
        )
    }
}
