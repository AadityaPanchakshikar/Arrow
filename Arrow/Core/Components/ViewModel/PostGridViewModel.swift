//
//  PostGridViewModel.swift
//  Arrow
//
//  Created by Ferocious_Lad on 18/05/23.
//

import Foundation


class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserPost() }
    }
    
    @MainActor
    func fetchUserPost() async throws{
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
