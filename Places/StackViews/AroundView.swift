//
//  AroundView_1.swift
//  Places
//
//  Created by junil on 4/1/24.
//

import SwiftUI

struct AroundView: View {
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    FirstTabView()
                        .tabItem {
                            Image(systemName: "round.fill")
                            Text("First")
                        }
                    SecondTabView()
                        .tabItem {
                            Image(systemName: "round.fill")
                            Text("Second")
                        }
                    ThirdTabView()
                        .tabItem {
                            Image(systemName: "round.fill")
                            Text("Third")
                        }
                    FourthTabView()
                        .tabItem {
                            Image(systemName: "round.fill")
                            Text("Fourth")
                        }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                HStack {
//                    Button("로그인 / 회원가입") {
//                        
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .controlSize(.large)
//                    .padding()
//                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AroundView_Previews: PreviewProvider {
    static var previews: some View {
        AroundView()
    }
}
