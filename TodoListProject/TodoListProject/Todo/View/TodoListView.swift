//
//  TodoListView.swift
//  TodoListProject
//
//  Created by vinyl on 3/10/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("할 일 목록") {
                        ForEach(viewModel.todoItem) { item in
                            if !item.isComplete {
                                HStack {
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isComplete ?
                                    "checkmark.circle.fill": "circle")
                                    .foregroundColor(item
                                        .isComplete ? .green :
                                            .gray)
                                    .onTapGesture {
                                        // isComplete toggle()
                                        viewModel.toggleItem(item: item)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                    Section("완료 목록") {
                        ForEach(viewModel.todoItem) { item in
                            if item.isComplete {
                                HStack {
                                    Text(item.title)
                                        .foregroundStyle(Color(.systemGray3))
                                        .strikethrough()
                                    Spacer()
                                    Image(systemName: item.isComplete ?
                                    "checkmark.circle.fill": "circle")
                                    .foregroundColor(item
                                        .isComplete ? .green :
                                            .gray)
                                    .onTapGesture {
                                        // isComplete toggle()
                                        viewModel.toggleItem(item: item)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                }
                .listStyle(PlainListStyle())
                
                Button("생성하기") {
                    viewModel.isPresented.toggle()
                }
                .frame(width: 200, height: 20)
                .padding()
                .foregroundColor(Color(.white))
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .sheet(isPresented: $viewModel.isPresented) {
                    NewTodoListView(viewModel: viewModel)
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: EditButton())
        }
        .padding()
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
