//
//  FriendsView.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import SwiftUI

struct FriendsView: View {
    private var friends = Friend.allFriends
    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                ZStack {
                    FriendCell(friend: friend)
                    .listRowSeparatorTint(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Color@*/Color(hue: 0.562, saturation: 0.461, brightness: 0.939)/*@END_MENU_TOKEN@*/)
                    
                    NavigationLink(destination: PhotoAlbumView()) {
                        EmptyView()
                    }
                    .frame(width: 0, height: 0)
                    .opacity(1)
                }
            }
            .navigationBarTitle(Text("Friends"))
            .environment(\.defaultMinListRowHeight, 86)
            .onAppear() {
                UITableView.appearance().showsVerticalScrollIndicator = false
                UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
            }
            .listStyle(.grouped)
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
