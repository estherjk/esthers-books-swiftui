//
//  LoginView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var tokenRepository: TokenRepository
    
    var body: some View {
        NavigationView {
            Form {
                Section(footer: LoginStatusView(loginStatus: tokenRepository.loginStatus)) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                }
                
                Section {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            tokenRepository.login(with: Credentials(username: username, password: password))
                        }, label: {
                            Text("Log in")
                        })
                        .disabled(username.isEmpty ||
                                  password.isEmpty ||
                                    tokenRepository.loginStatus == LoginStatus.processing)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Welcome")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginStatusView: View {
    let loginStatus: LoginStatus
    
    var body: some View {
        Group {
            switch loginStatus {
            case .notProcessed:
                Text("Enter your credentials.")
            case .processing:
                Text("Processing...")
            case .valid:
                Text("Success!")
            case .invalid:
                Text("Invalid credentials. Try again.")
            default:
                // Otherwise, leave blank
                Text("")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
