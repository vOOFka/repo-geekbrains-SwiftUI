//
//  LikeView.swift
//  vkswiftUI
//
//  Created by Home on 30.01.2022.
//

import SwiftUI

struct LikeView: View {
    @Binding var userLikeState: Bool
    @State var likeState: Bool
    @State private var degrees = 0.0
    
    init(userLikeState: Binding<Bool>) {
        self._userLikeState = userLikeState
        self.likeState = userLikeState.wrappedValue
    }
    
    var body: some View {
        Like()
            .stroke(.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .frame(width: 30, height: 30)
            .background(Like().foregroundColor(likeState ? Color.red : Color.white))
            .scaleEffect(likeState ? 1.2 : 1)
            .rotation3DEffect(Angle.degrees(degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
            .onTapGesture {
                withAnimation(animation()) {
                    likeState.toggle()
                    userLikeState.toggle()
                }
                withAnimation(.linear(duration: 1)) {
                    self.degrees += 180
                }
            }
    }
    
    func animation() -> Animation {
        return Animation
            .spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0)
            .speed(5)
            .delay(0.9)
    }
}

//struct LikeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeView()
//    }
//}
