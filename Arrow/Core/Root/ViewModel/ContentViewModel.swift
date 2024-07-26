//
//  ContentViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 14/05/23.
//
import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject{
    
    private let service = AuthService.shared
    private var cancelables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSebscribers()
    } 
    
    
    func setupSebscribers(){
        
        service.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancelables)
        
        service.$currentUser.sink{ [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancelables)
    }
}
