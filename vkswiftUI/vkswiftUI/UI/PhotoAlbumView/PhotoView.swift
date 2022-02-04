//
//  PhotoView.swift
//  vkswiftUI
//
//  Created by Home on 24.01.2022.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    @Binding var currentPhoto: Photo
    let size = sizeType.max   
    
    var body: some View {
        return GeometryReader { proxy in
            ZStack {
                let url = currentPhoto.sizes.first(where: { $0.type == size })!.urlPhoto
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .cornerRadius(10)
                    .clipped()
                
                LikeView(userLikeState: $currentPhoto.userLikes)
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                    .padding([.bottom, .trailing], 10)
                
            }
        }
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
