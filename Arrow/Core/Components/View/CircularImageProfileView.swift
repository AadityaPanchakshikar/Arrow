//
//  CircularImageProfileView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 16/05/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat{
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularImageProfileView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user.profileImageUrl{
            KFImage(URL(string:imageURL ))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height:size.dimension)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
    }
}

struct CircularImageProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageProfileView(user:User.MOCK_USERS[4], size:.large)
    }
}
