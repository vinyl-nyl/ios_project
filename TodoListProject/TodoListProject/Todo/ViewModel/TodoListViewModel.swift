//
//  TodoListViewModel.swift
//  TodoListProject
//
//  Created by vinyl on 3/11/24.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItem: [TodoModel] = []
    @Published var isPresented: Bool = false
    
    func addItem(title: String) {
        let newItem = TodoModel(title: title)
        todoItem.append(newItem)
    }
    
    func removeItem(at offsets: IndexSet) {
        todoItem.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleItem(item: TodoModel) {
        if let index = todoItem.firstIndex(where: { (originalItem) -> Bool in
            return originalItem.id == item.id
        }) {
            todoItem[index].isComplete.toggle()
        }
    }
}
