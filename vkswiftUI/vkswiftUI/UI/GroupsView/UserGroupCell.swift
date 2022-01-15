//
//  UserGroupCell.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct UserGroupCell: View {
    let group: UserGroup
    
    var body: some View {
        HStack {
            Image(group.name)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .modifier(RectangleShadow(shadowColor: .accentColor,
                                       shadowRadius: 3,
                                       shadowOpacity: 0.3))
                
            VStack(alignment: .leading, spacing: 5.0) {
                UserGroupNameText {
                    Text(group.name)
                }    
            }.padding(.leading, 20.0)
            Spacer()
        }.frame(height: 86)
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        let group = UserGroup(name: "Автолюбители")
        let group2 = UserGroup(name: "Очень-очень длинное название группы с фантастическими видео")
        UserGroupCell(group: group)
        UserGroupCell(group: group2)
    }
}
