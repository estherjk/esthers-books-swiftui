//
//  SplashView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity = 1.0
    
    var body: some View {
        // TODO: Make a fancy animation
        Image(systemName: "books.vertical")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.accentColor)
            .frame(width: 100, height: 100, alignment: .center)
            .opacity(opacity)
            .animation(Animation.easeIn(duration: 1).repeatForever(autoreverses: true))
            .onAppear { self.opacity = 0.2 }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
