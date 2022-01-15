//
//  MyBuilder.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct UserGroupNameText: View {
    var content: Text
 
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
 
    var body: some View {
        content
            .bold()
            .flipsForRightToLeftLayoutDirection(true)
            .font(Font.custom("Noto Sans Oriya", size: 20))
            .shadow(color: .gray, radius: 3, x: 4, y: -4)
            .frame(width: 250, height: 86, alignment: .trailing)
            .multilineTextAlignment(.trailing)
    }
}