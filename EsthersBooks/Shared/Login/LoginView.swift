//
//  LoginView.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/15/20.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
            }
            
            Section {
                HStack {
                    Spacer()
                    Button(action: {
                        TokenAPI().obtainTokenPair(username: username, password: password)
                    }, label: {
                        Text("Log in")
                    })
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
