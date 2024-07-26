//
//  FeedView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 36){
                    ForEach(viewModel.posts){ posts in
                        FeedCell(post: posts)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Text("Arrow") // add logo as image later
                        .font(.title2)
                        .italic()
                        .bold()
                }
                    
                ToolbarItem(placement:.navigationBarTrailing){
                    Image(systemName: "paperplane") // add logo as image later
                        .imageScale(.large)
            
                        
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
