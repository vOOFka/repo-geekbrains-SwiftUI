//
//  PhotoView.swift
//  vkswiftUI
//
//  Created by Home on 24.01.2022.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    let currentPhoto: Photo
    let size = sizeType.mid
    
    
    init(photo: Photo) {
        self.currentPhoto = photo
    }
    
    var body: some View {
        return GeometryReader { proxy in
            VStack {
                let url = currentPhoto.sizes.first(where: { $0.type == size })!.urlPhoto
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
            }
        }
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
