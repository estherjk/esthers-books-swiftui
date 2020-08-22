//
//  StartView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var tokenRepository: TokenRepository
    @EnvironmentObject var booksAPI: BooksAPI
    
    var body: some View {
        if (tokenRepository.loginStatus == LoginStatus.valid) {
            HomeView()
        }
        else {
            LoginView()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
