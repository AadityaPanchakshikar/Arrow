//
//  ProfileHeaderView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing:10){
            //pic & stats
            HStack{
                CircularImageProfileView(user: user, size: .large)
                
                Spacer()
                // stats
                HStack(spacing:8){
                    
                    UserStatView(value: 5, title: "Posts")
                    
                    UserStatView(value: 80, title: "Followers")
                    
                    UserStatView(value: 3, title: "Following")
                    
                        }
                }
                .padding(.horizontal)
                
                //name & bio
                VStack(alignment: .leading, spacing: 4){
                    
                    
                    Text(user.fullname ?? "User" )
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .italic()
                    
                    Text(user.bio ?? "")
                        .font(.footnote)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                //action button
                Button{
                    if user.isCurrentUser{
                        showEditProfile.toggle()
                    }else{
                        
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit" : "Follow")
                        .font(.subheadline)
                        .fontWeight (.semibold)
                        .frame (width: 360, height: 32)
                        .background(user.isCurrentUser ? .white: Color (.systemBlue))
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(8)
                        .overlay (
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear, lineWidth:1)
                        )
                }
                
                Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
