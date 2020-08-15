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
    
    @ObservedObject var tokenAPI = TokenAPI()
    
    var body: some View {
        Form {
            Section(header: TokenStatusView(tokenStatus: tokenAPI.tokenStatus)) {
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
                    .disabled(username.isEmpty || password.isEmpty)
                    Spacer()
                }
            }
        }
    }
}

struct TokenStatusView: View {
    let tokenStatus: TokenStatus
    
    var body: some View {
        Group {
            switch tokenStatus {
            case .notProcessed:
                Text("Welcome")
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