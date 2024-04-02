//
//  PhotoView.swift
//  PetInformationApp
//
//  Created by junil on 3/25/24.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                DogImageView(imageName: "dog1", borderColor: .mint)
                DogImageView(imageName: "dog2", borderColor: .blue)
                DogImageView(imageName: "dog3", borderColor: .yellow)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(.yellow)
                .opacity(0.2)
                .shadow(radius: 5)
            )
        }
        .scrollIndicators(.hidden)
    }
}

struct DogImageView: View {
    var imageName: String
    var borderColor: Color
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 160, height: 160)
            .overlay(Rectangle().stroke(borderColor, lineWidth: 4))
    }
}

#Preview {
    PhotoView()
}
