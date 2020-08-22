//
//  SplashView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        // TODO: Make a fancy animation
        Image(systemName: "books.vertical")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.accentColor)
            .frame(width: 100, height: 100, alignment: .center)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
