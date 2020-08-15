//
//  EsthersBooksApp.swift
//  Shared
//
//  Created by Esther Kim on 7/29/20.
//

import SwiftUI

@main
struct EsthersBooksApp: App {
    @StateObject var tokenAPI = TokenAPI()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(tokenAPI)
        }
    }
}
