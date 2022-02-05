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
    @State var photoCellHeight: CGFloat = .zero
    
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
                            .frame(height: photoCellHeight)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .onAppear{
                    viewModel.fetchPhotos()
                }
                .onPreferenceChange(PhotoHeightPreferenceKey.self) { cellHeight in
                    photoCellHeight = cellHeight
                }
            }
            .navigationBarTitle(viewModel.currentFriend.fullName)
        }
    }
}

struct PhotoHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

//struct PhotoAlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        let photo = Photo.getRandomPhotos()
//
//        PhotoAlbumView(photos: photo)
//    }
//}
