//
//  UserService.swift
//  Arrow
//
//  Created by Ferocious_Lad on 16/05/23.
//

import Foundation
import Firebase

struct UserService {
    

    static func fetchUser(withUid:String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(withUid).getDocument()
       return try snapshot.data(as: User.self)
    }
    
   static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
