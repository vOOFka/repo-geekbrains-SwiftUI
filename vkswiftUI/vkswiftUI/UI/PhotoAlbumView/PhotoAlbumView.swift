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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach($viewModel.photosItems) { $photo in
                        PhotoView(currentPhoto: $photo)
                            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .onAppear{
                    viewModel.fetchPhotos()
                }
            }
            .navigationBarTitle(viewModel.currentFriend.fullName)
        }
    }
}

//struct PhotoAlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        let photo = Photo.getRandomPhotos()
//
//        PhotoAlbumView(photos: photo)
//    }
//}
