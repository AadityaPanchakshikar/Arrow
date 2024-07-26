//
//  EditProfileViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 16/05/23.
//
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel:ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(from: selectedImage)}}
    }
    
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user:User){
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
        
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        var data = [String: Any]()
        // update Profile image if changed
        
        if let uiImage = uiImage {
           let imageURL = try await ImageUploader.uploadImage(image:uiImage)
            data["ProfileImageURL"] = imageURL
        }
        
    
        // update name if changed
        
        if !fullname.isEmpty && user.fullname != fullname{
            data["fullname"] = fullname
        }
        
        // update profilename if changed
        if !bio.isEmpty && user.fullname != fullname{
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection ("users").document(user.id).updateData(data)
        }
    }
    
}
