//
//  FriendsView.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var viewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.friendsCategory) { friendsCategory in
                Section(header: FriendsSectionHeader { Text(friendsCategory.category) }) {
                    ForEach(friendsCategory.friends) { friend in
                        if friend.category == friendsCategory.category {
                            ZStack {
                                FriendCell(friend: friend)
                                    .listRowSeparatorTint(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Color@*/Color(hue: 0.562, saturation: 0.461, brightness: 0.939)/*@END_MENU_TOKEN@*/)
                                    .listRowInsets(EdgeInsets())
                                NavigationLink(destination:
                                                PhotoAlbumView(viewModel:
                                                                PhotoAlbumViewModel(friend: friend,
                                                                                    networkService: NetworkServiceImplimentation())
                                                              )) {
                                    EmptyView()
                                }
                                .frame(width: 0, height: 0)
                                .opacity(1)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Friends"))
            .environment(\.defaultMinListRowHeight, 86)
            .onAppear() {
                viewModel.fetchFriends()
                UITableView.appearance().showsVerticalScrollIndicator = false
                UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
            }
            .listStyle(.grouped)
        }
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
