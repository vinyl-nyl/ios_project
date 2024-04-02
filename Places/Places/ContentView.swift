//
//  ContentView.swift
//  Places
//
//  Created by junil on 4/1/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Places")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: HotPlacesListView()) {
                    Text("핫플레이스 찾기")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

struct HotPlacesListView: View {
    var body: some View {
        List {
            Text("핫플레이스 1")
            Text("핫플레이스 2")
            Text("핫플레이스 3")
            Text("핫플레이스 4")
            Text("핫플레이스 5")
        }
        .navigationTitle("핫플레이스 목록")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
