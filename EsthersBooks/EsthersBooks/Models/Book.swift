//
//  Book.swift
//  EsthersBooks
//
//  Created by Esther Jun Kim on 7/25/20.
//  Copyright © 2020 Esther Jun Kim. All rights reserved.
//

import SwiftUI

struct Book: Codable {
    var url: String
    var genres: [String]
    var created_at: String
    var updated_at: String
    var title: String
    var trello_id: String
    var date_started: String
    var date_finished: String
    var cover_attachment: CoverAttachment
}

extension Book {
    // Use SampleData helper to load images
    var image: Image {
        ImageStore.shared.image(name: cover_attachment.name)
    }
}

struct CoverAttachment: Codable {
    var id: String
    var pos: Int
    var url: String
    var date: String
    var name: String
    var bytes: Int
    var fileName: String
    var idMember: String
    var isUpload: Bool
    var mimeType: String?
    var edgeColor: String
}
