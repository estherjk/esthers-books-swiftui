//
//  ProfileView.swift
//  EsthersBooks (iOS)
//
//  Created by Esther Kim on 8/22/20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var tokenRepository: TokenRepository
    @EnvironmentObject var userAPI: UserAPI
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                
                Form {
                    if let user = userAPI.user {
                        Section {
                            HStack {
                                ProfileItemLabel(label: "First name")
                                Text(user.first_name)
                            }
                            
                            HStack {
                                ProfileItemLabel(label: "Last name")
                                Text(user.last_name)
                            }
                            
                            HStack {
                                ProfileItemLabel(label: "Username")
                                Text(user.username)
                            }
                            
                            HStack {
                                ProfileItemLabel(label: "Email")
                                Text(user.email)
                            }
                        }
                    }
                    
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
                .frame(maxWidth: 700)
            }
            .navigationTitle("Profile")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            guard let accessToken = tokenRepository.accessToken else { return }
            
            userAPI.getMe(accessToken: accessToken)
        })
    }
}

struct ProfileItemLabel: View {
    let label: String
    
    var body: some View {
        Text(label)
            .foregroundColor(Color.secondary)
            .frame(width: 80, alignment: .leading)
    }
}

// TODO: Figure out the best way to share state in preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(TokenRepository())
            .environmentObject(UserAPI())
    }
}
