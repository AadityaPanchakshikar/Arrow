//
//  UploadPostViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//
import Foundation
import PhotosUI
import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject  {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(from: selectedImage)}}
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption:String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore() .collection("posts").document()
        
        // see ImageUploader in services Folder
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        let post = Post(id: postRef.documentID,
                        ownerUid: uid,
                        caption: caption,
                        likes: 0,
                        imageUrl: imageUrl,
                        timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return } // convrt to post json so firebase can understand
        
        try await postRef.setData(encodedPost)
    }
    
}
