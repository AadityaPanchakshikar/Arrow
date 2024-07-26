//
//  SearchViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 16/05/23.
//

import Foundation


class SeachViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
}
