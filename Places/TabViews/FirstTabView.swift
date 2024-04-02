//
//  FirstTabView.swift
//  Places
//
//  Created by junil on 4/14/24.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("지역별 명소를 한 눈에 확인해요")
            .font(.title2)
            .fontWeight(.bold)
            .padding()
        
        Button("로그인 / 회원가입") {
            
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
    }
}

#Preview {
    FirstTabView()
}
