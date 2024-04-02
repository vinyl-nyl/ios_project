//
//  FirstView.swift
//  Places
//
//  Created by junil on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Places")
                    .font(.largeTitle)
                    .bold()
                NavigationLink(
                    destination: AroundView(),
                    isActive: $isActive
                ) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = true
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
