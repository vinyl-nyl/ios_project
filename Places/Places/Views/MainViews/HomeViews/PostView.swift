//
//  PostView.swift
//  Places
//
//  Created by junil on 5/22/24.
//

import SwiftUI

struct PostView: View {
    @State private var recentPosts: [Post] = []
    @State private var createNewPost: Bool = false
    var body: some View {
        NavigationStack {
            ReusablePostView(posts: $recentPosts)
                .hAlign(.center).vAlign(.center)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        createNewPost.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(13)
                            .background(.indigo, in: Circle())
                    }
                    .padding(15)
                }
                .navigationTitle("최근 게시물")
        }
        .fullScreenCover(isPresented: $createNewPost) {
            CreateNewPost { post in
                /// - Adding Created post at the Top of the Recent Posts
                recentPosts.insert(post, at: 0)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
