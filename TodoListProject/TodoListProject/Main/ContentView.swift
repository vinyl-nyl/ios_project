//
//  ContentView.swift
//  TodoListProject
//
//  Created by vinyl on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            TodoListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
