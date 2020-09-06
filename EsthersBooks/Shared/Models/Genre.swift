//
//  Genre.swift
//  EsthersBooks
//
//  Created by Esther Kim on 9/6/20.
//

import SwiftUI

struct Genre: Codable {
    var url: String
    var created_at: Date
    var updated_at: Date
    var name: String
    var trello_id: String
    var color: String
}
