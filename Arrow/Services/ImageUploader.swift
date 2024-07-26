//
//  ImageUploader.swift
//  Arrow
//
//  Created by Ferocious_Lad on 16/05/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader{
    
    static func uploadImage(image:UIImage) async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }catch{
            print("print failed upload image \(error.localizedDescription)")
            return nil
        }
    }
    
}


// this same code is used to upload post as well as profile image
// we are using UIImage becasue for some reason apple hasn't uptated swiftUI to do that
