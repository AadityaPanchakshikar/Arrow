//
//  FeedCell.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            //Image + Username
            Divider()
            HStack{
                if let user = post.user {
                    CircularImageProfileView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
            }
            .padding(.leading, 8)
            
            //post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle ())
                
            
            //action buttons
            HStack(spacing:16){
                Button{
                    print("liked Post")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button{
                    print("comment")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button{
                    print("shared")
                }label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            //likes label
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: . infinity, alignment: . leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            //caption label
            
            HStack{
                Text ("\(post.user?.username ?? ""):  ").fontWeight(.semibold) +
                Text ("\(post.caption)")
            }
            .frame(maxWidth: . infinity, alignment: . leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 0.5)
            
            Text("6h ago")
                .foregroundColor(.gray)
                .font(.footnote)
                .frame(maxWidth: . infinity, alignment: . leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
