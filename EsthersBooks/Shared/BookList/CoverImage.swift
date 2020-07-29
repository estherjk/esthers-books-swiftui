//
//  CoverImage.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct CoverImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 300)
            .shadow(radius: 10)
    }
}

struct CoverImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverImage(image: sampleBooksData[0].image)
    }
}
