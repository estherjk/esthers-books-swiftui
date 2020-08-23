//
//  User.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/23/20.
//

import SwiftUI

struct User: Codable {
    var id: Int
    var username: String
    var first_name: String
    var last_name: String
    var email: String
}
