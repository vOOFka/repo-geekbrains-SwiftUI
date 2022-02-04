//
//  FriendCell.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import SwiftUI
import Kingfisher

struct FriendCell: View {
    let friend: Friend
    @State private var tapOnAvatar = false
    
    var body: some View {
        HStack {
            KFImage(URL(string: friend.urlAvatar ?? ""))
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .modifier(CircleShadow(shadowColor: .accentColor,
                                       shadowRadius: 6,
                                       shadowOpacity: 0.8))
                .scaleEffect(tapOnAvatar ? 1.2 : 1)
                .onTapGesture {
                    withAnimation(animation()) {
                        tapOnAvatar.toggle()
                    }
                }
            VStack(alignment: .leading, spacing: 5.0) {
                Text(friend.fullName)
                Text(friend.cityName ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .italic()
            }.padding(.leading, 20.0)
            Spacer()
        }.frame(height: 86)
    }
    
    func animation() -> Animation {
        tapOnAvatar.toggle()
        return Animation
            .spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0)
            .speed(2)
            .delay(0.075)
    }
}

//struct FriendCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let friend: Friend = Friend(name: "Иванов Иван", city: "Москва")
//        FriendCell(friend: friend)
//    }
//}
