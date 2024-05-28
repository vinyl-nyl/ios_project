//
//  CreateNewPost.swift
//  Places
//
//  Created by junil on 5/22/24.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct CreateNewPost: View {
    /// - Callbacks
    var onPost: (Post) -> ()
    /// - Post Properties
    @State private var postText: String = ""
    @State private var postImageData: Data?
    /// - Stored User Data From UserDefaults(AppStorage)
    @AppStorage("user_profile_url") private var profileURL: URL?
    @AppStorage("user_name") private var userName: String = ""
    @AppStorage("user_UID") private var userUID: String = ""
    /// - View Properties
    @Environment(\.dismiss) private var dismiss
    @State private var isLoading: Bool = false
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var photoItem: PhotosPickerItem?
    @FocusState private var showKeyboard: Bool
    var body: some View {
        VStack {
            HStack {
                Menu {
                    Button("취소", role: .destructive) {
                        dismiss()
                    }
                } label: {
                    Text("취소")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
                .hAlign(.leading)
                
                Button(action: createPost){
                    Text("게시")
                        .font(.callout)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 6)
                        .background(.indigo, in: Capsule())
                }
                .disableWithOpacity(postText == "")
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                Rectangle()
                    .fill(.gray.opacity(0.05))
                    .ignoresSafeArea()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    TextField("플레이스를 추천해주세요!", text: $postText, axis: .vertical)
                        .focused($showKeyboard)
                    if let postImageData, let image = UIImage(data: postImageData) {
                        GeometryReader {
                            let size = $0.size
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            /// - Delete Button
                                .overlay(alignment: .topTrailing) {
                                    Button {
                                        withAnimation(.easeInOut(duration: 0.25)){
                                            self.postImageData = nil
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                            .fontWeight(.bold)
                                            .tint(.red)
                                    }
                                    .padding(10)
                                }
                        }
                        .clipped()
                        .frame(height: 220)
                    }
                    
                }
                .padding(15)
            }
            
            Divider()
            
            HStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    Image(systemName: "photo.on.rectangle")
                        .font(.title3)
                }
                .hAlign(.leading)
                
                Button("확인") {
                    showKeyboard = false
                }
            }
            .foregroundStyle(.indigo)
            .padding(.horizontal, 30)
            .padding(.vertical, 5)
        }
        .vAlign(.top)
        .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
        .onChange(of: photoItem) { oldValue, newValue in
            if let newValue {
                Task {
                    if let rawImageData = try? await newValue.loadTransferable(type: Data.self),
                       let image = UIImage(data: rawImageData),
                       let compressedImageData = image.jpegData(compressionQuality: 0.5) {
                        /// UI Must be done on Main Thread
                        await MainActor.run {
                            postImageData = compressedImageData
                            photoItem = nil
                        }
                    }
                }
            }
        }
        .alert(errorMessage, isPresented: $showError, actions: {})
        /// - Loading View
        .overlay {
            LoadingView(show: $isLoading)
        }
    }
    
    // MARK: Post Content To Firebase
    func createPost() {
        isLoading = true
        showKeyboard = false
        Task {
            do {
                guard let profileURL = profileURL else {return}
                /// Step 1: Uploading Image If any
                /// Used to delete the Post(Later shown in the Video)
                let imageReferenceID = "\(userUID)\(Date())"
                let storageRef = Storage.storage().reference().child("Post_Images").child(imageReferenceID)
                if let postImageData {
                    let _ = try await storageRef.putDataAsync(postImageData)
                    let downloadURL = try await storageRef.downloadURL()
                    
                    /// Step 3: Create Post Object With Image Id And URL
                    let post = Post(text: postText,imageURL: downloadURL, imageReferenceID: imageReferenceID, userName: userName, userUID: userUID, userProfileURL: profileURL)
                    try await createDocumentAtFirebase(post)
                } else {
                    /// Step 2: Directly Post Text Data to Firebase (Since ther is no Images Present)
                    let post = Post(text: postText, userName: userName, userUID: userUID, userProfileURL: profileURL)
                    try await createDocumentAtFirebase(post)
                }
            } catch {
                await setError(error)
            }
        }
    }
    
    func createDocumentAtFirebase(_ post: Post) async throws {
        /// - Writing Document to Firebase Firestore
        let _ = try Firestore.firestore().collection("Posts").addDocument(from: post, completion: { error in
            if error == nil {
                /// Post Successfully Stored ad Firebase
                print("Saved Successed")
                isLoading = false
                onPost(post)
                dismiss()
            }
        })
    }
    
    // MARK: Displaying Errors as Alert
    func setError(_ error: Error) async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

struct CreateNewPost_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPost{ _ in
            
        }
    }
}
