//
//  SearchView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = SeachViewModel()
    var body: some View {
        
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:16){
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user){
                            HStack {
                                CircularImageProfileView(user: user, size: .small)
                                
                                VStack(alignment:.leading){
                                    
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname{
                                        Text(fullname )
                                    }
                                    
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }.padding(.top, 8)
                .searchable(text:$searchText, prompt: "Search..")
            }
            .navigationDestination(for: User.self, destination:{ user in 
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
                                   
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
