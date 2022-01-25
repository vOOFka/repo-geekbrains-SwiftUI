//
//  MainView.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.2.fill")
                }
            
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "person.3.fill")
                }
            NewsfeedView()
                .tabItem {
                    Label("Newsfeed", systemImage: "applelogo")
                }
        }
        .navigationViewStyle(.columns)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
