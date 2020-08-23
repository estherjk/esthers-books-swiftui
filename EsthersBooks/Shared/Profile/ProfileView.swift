//
//  ProfileView.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var tokenRepository: TokenRepository
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            tokenRepository.logout()
                        }, label: {
                            Text("Log out")
                        })
                        .foregroundColor(Color.red)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

// TODO: Figure out the best way to share state in preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
