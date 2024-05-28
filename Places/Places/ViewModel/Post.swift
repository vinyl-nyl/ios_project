//
//  Post.swift
//  Places
//
//  Created by junil on 5/22/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var text: String
    var imageURL: URL?
    var imageReferenceID: String = ""
    var publishedDate: Date = Date()
    var likedIDs: [String] = []
    var userName: String
    var userUID: String
    var userProfileURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case imageURL
        case imageReferenceID
        case publishedDate
        case likedIDs
        case userName
        case userUID
        case userProfileURL
    }
}
