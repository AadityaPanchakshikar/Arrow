//
//  LoginViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 15/05/23.
//

import Foundation


class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
 
    func signIn() async throws {
        try await AuthService.shared.Login(whitEmail: email, password:password )
    }
}
