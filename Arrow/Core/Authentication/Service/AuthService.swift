//
//  AuthService.swift
//  Arrow
//
//  Created by Ferocious_Lad on 14/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init(){
        
        Task{ try await LoadUserData() }
    }
    
    @MainActor
    func Login(whitEmail email:String, password:String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            // above  create user func is from firebase
            self.userSession = result.user
            try await LoadUserData()
        }catch{ print("Err login user: \(error.localizedDescription )") }
    }
    
    @MainActor
    func CreateUser(email:String, username:String, password:String) async throws {
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            // above  create user func is from firebase
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        }catch{ print("Err register user: \(error.localizedDescription )") }
    }
    
    @MainActor
    func LoadUserData() async throws {
        self.userSession = Auth.auth().currentUser // perform a check to see if the user is logged in. user propety being set
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func SignOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid:String, username:String, email:String) async {
        
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try?  Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
