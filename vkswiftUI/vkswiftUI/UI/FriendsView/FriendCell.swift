//
//  FriendCell.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import SwiftUI

struct FriendCell: View {
    let friend: Friend
    
    var body: some View {
        HStack {
            Image(friend.name)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .modifier(CircleShadow(shadowColor: .accentColor,
                                       shadowRadius: 6,
                                       shadowOpacity: 0.8))
            VStack(alignment: .leading, spacing: 5.0) {
                Text(friend.name)
                Text(friend.city)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .italic()
            }.padding(.leading, 20.0)
            Spacer()
        }.frame(height: 86)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        let friend: Friend = Friend(name: "Иванов Иван", city: "Москва")
        FriendCell(friend: friend)
    }
}
