//
//  CoverImageView.swift
//  EsthersBooks
//
//  Reference: https://dev.to/gualtierofr/remote-images-in-swiftui-49jp
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
        Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView(imageURL: "https://trello-attachments.s3.amazonaws.com/564d07a87721d8698ff010d3/564d07a87721d8698ff010f6/40ffac28569fe61365f0bd64a1e6e1b1/wives-and-daughters.jpg")
    }
}
