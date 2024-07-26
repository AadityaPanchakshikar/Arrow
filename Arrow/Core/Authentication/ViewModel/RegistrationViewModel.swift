//
//  RegistrationViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 14/05/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var username = ""
    @Published var password  = ""
    
    func createUser() async throws{
        try await
        AuthService.shared.CreateUser(email: email, username: username, password: password)
        
        email = ""
        username = ""
        password  = ""
    }
}
