//
//  GroupsView.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct GroupsView: View {
    private var groups = UserGroup.userGroups
    
    var body: some View {
        NavigationView {
            List(groups) { group in
                ZStack {
                    UserGroupCell(group: group)
                    .listRowSeparatorTint(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Color@*/Color(hue: 0.562, saturation: 0.461, brightness: 0.939)/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle(Text("Groups"))
            .environment(\.defaultMinListRowHeight, 86)
            .onAppear() {
                UITableView.appearance().showsVerticalScrollIndicator = false
                UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
            }
            .listStyle(.grouped)
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
