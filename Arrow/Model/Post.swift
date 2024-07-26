//
//  File.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import Foundation
import Firebase

struct Post: Codable, Hashable, Identifiable{
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "You know who i am.",
              likes: 7,
              imageUrl: "ironman",
              timestamp: Timestamp() ,
              user: User.MOCK_USERS[0]),
              
              .init(id: NSUUID().uuidString,
                    ownerUid: NSUUID().uuidString,
                    caption: "Fastest man Alive.",
                    likes: 7,
                    imageUrl: "flash",
                    timestamp:  Timestamp() ,
                    user: User.MOCK_USERS[1]),
    ]
}
