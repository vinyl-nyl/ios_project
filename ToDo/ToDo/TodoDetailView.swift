//
//  TodoDetailView.swift
//  ToDo
//
//  Created by junil on 4/1/24.
//

import SwiftUI

struct TodoDetailView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack {
            TextField("Todo Title", text: $todo.title)
                .font(.title2)
                .padding(5)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 2)
                )
            TextEditor(text: $todo.detail)
                .padding(5)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 2)
                )
        }
        .padding()
        .navigationTitle("Edit Task 📝")
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "2번째 화면의 Todo"))
}
