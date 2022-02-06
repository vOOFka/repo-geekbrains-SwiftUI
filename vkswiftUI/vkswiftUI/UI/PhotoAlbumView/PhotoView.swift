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
    let index: Int?
    @Binding var selection: Int?
    
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
                
                LikeView(currentPhoto: $currentPhoto)
                    .frame(width: proxy.size.width - 14, height: proxy.size.height - 10, alignment: .bottomTrailing)
            }
            .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width)
            .anchorPreference(key: SelectionPreferenceKey.self, value: .bounds) {
                index == self.selection ? $0 : nil
            }
            .onTapGesture {
                withAnimation(.default) {
                    self.selection = index
                }
            }
        }
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
