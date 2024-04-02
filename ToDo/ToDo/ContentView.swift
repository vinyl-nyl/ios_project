//
//  ContentView.swift
//  ToDo
//
//  Created by junil on 3/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "과제 제출하기"),
        Todo(title: "쉬기") ]
    
    func addTodo() {
        withAnimation {
            let newTodo = Todo(title: "새로운 투두")
//            todoList.append(newTodo)
            modelContext.insert(newTodo)
        }
    }
    
    func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
//                todoList.remove(at: index)
                let todo = todoList[index]
                modelContext.delete(todo)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        Image(systemName: todo.isCompleted == true ? "circle.fill" : "circle")
                            .foregroundStyle(.pink)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        NavigationLink {
                            TodoDetailView(todo: todo)
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: .gray)
                                .foregroundStyle(todo.isCompleted == true ? .gray : .primary)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(.plain)
            .navigationTitle("ToDo 🏓")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
