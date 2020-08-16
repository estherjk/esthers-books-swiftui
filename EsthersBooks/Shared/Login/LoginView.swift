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
    
    @EnvironmentObject var tokenAPI: TokenAPI
    
    var body: some View {
        NavigationView {
            Form {
                Section(footer: TokenStatusView(tokenStatus: tokenAPI.tokenStatus)) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button(action: {
                            tokenAPI.obtainTokenPair(username: username, password: password)
                        }, label: {
                            Text("Log in")
                        })
                        .disabled(username.isEmpty || password.isEmpty || tokenAPI.tokenStatus == TokenStatus.processing)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Welcome")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TokenStatusView: View {
    let tokenStatus: TokenStatus
    
    var body: some View {
        Group {
            switch tokenStatus {
            case .notProcessed:
                Text("Enter your credentials.")
            case .processing:
                Text("Processing...")
            case .valid:
                Text("Success!")
            case .invalid:
                Text("Invalid credentials. Try again.")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
