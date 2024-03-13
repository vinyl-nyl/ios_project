//
//  TodoModel.swift
//  TodoListProject
//
//  Created by vinyl on 3/10/24.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isComplete: Bool = false
}

extension TodoModel {
    static var MOCK_DATA: [TodoModel] {
        get {
            return [
                TodoModel(title: "iOS App Dev"),
                TodoModel(title: "달리기 100바퀴 뛰기"),
                TodoModel(title: "개발 서적 완독하기"),
                TodoModel(title: "저녁 식사 요리하기"),
                TodoModel(title: "맥북 파일 정리하기")
            ]
        }
    }
}
