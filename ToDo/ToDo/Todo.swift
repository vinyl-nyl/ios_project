//
//  Todo.swift
//  ToDo
//
//  Created by junil on 3/27/24.
//

import Foundation
import SwiftData

@Model
class Todo: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var detail: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
        self.detail = ""
    }
}
