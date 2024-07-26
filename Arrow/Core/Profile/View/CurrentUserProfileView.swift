//
//  CurrentUserProfileView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct CurrentUserProfileView: View {

    let user:  User
    
    var posts: [Post]   {
         return Post.MOCK_POSTS.filter({$0.user?.fullname == user.fullname})
            }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                // Header
                ProfileHeaderView(user: user)
                    // Post grid View
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                        AuthService.shared.SignOut()
                    }label: {
                         Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black )
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
