//
//  ReusablePostView.swift
//  Places
//
//  Created by junil on 5/26/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseDatabase

struct ReusablePostView: View {
    @Binding var posts: [Post]
    /// - View Properties
    @State var isFetching: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                if isFetching {
                    ProgressView()
                        .padding(.top, 30)
                } else {
                    if posts.isEmpty {
                        /// No Post's Found on Firestore
                        Text("게시물을 찾을 수 없습니다.")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .padding(.top, 30)
                    } else {
                        /// - Displaying Post's
                        Posts()
                    }
                }
            }
        }
        .refreshable {
            /// - Scroll to Refresh
            isFetching = true
            posts = []
            await fetchPosts()
        }
        .task {
            /// - Fetching For One Time
            guard posts.isEmpty else {return}
            await fetchPosts()
        }
    }
    
    /// - Displaying Fetched Post's
    @ViewBuilder
    func Posts()-> some View {
        ForEach(posts) { post in
            
        }
    }
    
    /// - Fetching Post's
    func fetchPosts() async {
        do {
            var query: Query!
            query = Firestore.firestore().collection("Posts")
                .order(by: "publishedDate", descending: true)
                .limit(to: 20)
            let docs = try await query.getDocuments()
            let fetchedPosts = docs.documents.compactMap { doc -> Post? in
                try? doc.data(as: Post.self)
            }
            await MainActor.run(body: {
                posts = fetchedPosts
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ReusablePostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
