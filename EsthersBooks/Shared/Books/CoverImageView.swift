//
//  CoverImageView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/16/20.
//

import SwiftUI

struct CoverImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageURL: String) {
        imageLoader = ImageLoader(urlString: imageURL)
    }
    
    var body: some View {
        // TODO: Is there a better way to update the placeholder image when the actual image is available?
        if imageLoader.data != nil {
            Image(uiImage: UIImage(data:imageLoader.data!)!)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
        }
        else {
            Image(systemName: "book.closed")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.primary)
        }
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView(imageURL: "https://trello-attachments.s3.amazonaws.com/564d07a87721d8698ff010d3/564d07a87721d8698ff010f6/40ffac28569fe61365f0bd64a1e6e1b1/wives-and-daughters.jpg")
    }
}
