//
//  PhotoAlbumView.swift
//  vkswiftUI
//
//  Created by Home on 14.01.2022.
//

import SwiftUI
import ASCollectionView

struct PhotoAlbumView: View {
    @ObservedObject var viewModel: PhotoAlbumViewModel
    
    init(viewModel: PhotoAlbumViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ASCollectionView(data: $viewModel.photosItems)
        { $photo, _ in
            PhotoView(currentPhoto: $photo)
        }.layout {
            .grid(
                layoutMode: .fixedNumberOfColumns(2),
                itemSpacing: 8,
                lineSpacing: 16
            )
        }.onAppear {
            viewModel.fetchPhotos()
        }
        .navigationBarTitle(viewModel.currentFriend.fullName)
    }
}

//struct PhotoAlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        let photo = Photo.getRandomPhotos()
//
//        PhotoAlbumView(photos: photo)
//    }
//}
