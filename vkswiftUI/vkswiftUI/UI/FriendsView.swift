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
                FriendCell(friend: friend)
            }
            .navigationBarTitle(Text("Friends"))
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
