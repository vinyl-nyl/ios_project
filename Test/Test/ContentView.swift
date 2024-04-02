//
//  ContentView.swift
//  Test
//
//  Created by junil on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Rectangle()
//                .frame(width: 50.0, height: 50.0)
//                .foregroundStyle(.teal)
//            HStack {
//                Rectangle()
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                    .foregroundStyle(.red)
//                Capsule()
//                    .frame(width: 200, height: 50)
//            }
//            Ellipse()
//                .frame(width: 50, height: 100)
//                .foregroundStyle(.blue)
//            Spacer()
//            Color.green
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
//        }
        
        ZStack {
            Circle()
                .foregroundStyle(.indigo)
            Capsule()
                .frame(width: 200, height: 100)
                .foregroundStyle(.teal)
            
            Capsule()
                .frame(width: 100, height: 200)
                .foregroundColor(.teal)
            
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
