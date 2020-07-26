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
            // ebook recommended cover size ratio is 1.6:1
            .frame(width: 200.0, height: 320.0)
            .shadow(radius: 10)
    }
}

struct CoverImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverImage(image: Image("justice-awakening"))
    }
}
