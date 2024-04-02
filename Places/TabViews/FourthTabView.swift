//
//  FourthTabView.swift
//  Places
//
//  Created by junil on 4/14/24.
//

import SwiftUI

struct FourthTabView: View {
    var body: some View {
        VStack {
            Text("Places")
                .font(.title)
                .bold()
            Spacer()
            Text("Place와 함께 떠나볼까요?")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Spacer()
            VStack {
                Button("로그인") {
                    
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                Button("회원가입") {
                    
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
            }
        }
    }
}

#Preview {
    FourthTabView()
}
