//
//  RectangleShadow.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct RectangleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowOpacity: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(10)
                    .opacity(shadowOpacity)
                    .shadow(color: shadowColor, radius: shadowRadius, x: 5, y: 5)
            )
    }
}

