//
//  MainView.swift
//  Places
//
//  Created by junil on 4/21/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        // MARK: TabView With Recent Post's And Profile Tabs
        TabView {
            PostView()
                .tabItem {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                    Text("Post's")
                }
            
            UserView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        // Canging Tab Label Tint to Black
        .tint(.indigo)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
