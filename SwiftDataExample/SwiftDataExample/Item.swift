//
//  Item.swift
//  SwiftDataExample
//
//  Created by junil on 4/1/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
class Todo {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
