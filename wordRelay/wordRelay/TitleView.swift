//
//  TitleView.swift
//  wordRelay
//
//  Created by junil on 3/25/24.
//

import SwiftUI

struct TitleView: View {
    let title: String = "끝말잇기 게임"
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(.teal)
                    .opacity(0.2)
                    .shadow(radius: 5))
                .padding(.top, 10)
        }
    }
}

#Preview {
    TitleView()
}
