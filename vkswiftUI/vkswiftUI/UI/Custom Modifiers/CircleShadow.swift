//
//  CircleShadow.swift
//  vkswiftUI
//
//  Created by Home on 14.01.2022.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowOpacity: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(Color.white)
                    .opacity(shadowOpacity)
                    .shadow(color: shadowColor, radius: shadowRadius, x: 5, y: 5)                    
            )
    }
}


