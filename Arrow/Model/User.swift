//
//  User.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser:Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }// this is so to show endit button or follow button depending up on the bool
    
} // later add more data like cal burned strike etc.. for our fitness app


// these are Mock dummy users just the test app.
extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "IRON-MAN", fullname:"Anthony Stark" , email: "queen@gmail.com"),
        .init(id: UUID().uuidString, username: "Flash", fullname:"Barry Allen" , email: "allen@gmail.com"),
        .init(id: UUID().uuidString, username: "Bataman", fullname:"Bruce Wayne" , email: "wyane@gmail.com"),
        .init(id: UUID().uuidString, username: "SPIDER-MAN", fullname:"Peter Parkar" , email: "parkar@gmail.com"),
        .init(id: UUID().uuidString, username: "Arrow", fullname:"Oliver Queen" , email: "queen@gmail.com"),
        
    ]
}



