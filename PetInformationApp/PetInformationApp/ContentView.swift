//
//  ContentView.swift
//  PetInformationApp
//
//  Created by junil on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileView()
            LikesView()
            SkillView()
            PhotoView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
