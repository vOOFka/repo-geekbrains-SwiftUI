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
        HStack{
            Image(friend.name)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text(friend.name)
                Text(friend.city)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        let friend: Friend = Friend(name: "Иванов Иван", city: "Москва")
        FriendCell(friend: friend)
    }
}
