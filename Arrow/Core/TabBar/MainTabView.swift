//
//  MainTabView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    let user: User
    var body: some View {
        
        TabView(selection: $selectedIndex){
            
           FeedView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "square.stack.fill")
                }.tag(0)
            
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "plus.app")
                }.tag(2)
            
            Text("No new Notifications")
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "heart")
                }.tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem{
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.teal)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }
}
