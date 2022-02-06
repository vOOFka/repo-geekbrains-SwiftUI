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
    @State private var selection: Int? = nil
    
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
                        PhotoView(currentPhoto: $photo, index: $photo.id, selection: $selection)
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
                .overlayPreferenceValue(SelectionPreferenceKey.self) {
                    SelectionRect(anchor: $0)
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

struct SelectionPreferenceKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

struct SelectionRect: View {
    let anchor: Anchor<CGRect>?
    var body: some View {
        GeometryReader { proxy in
            if let rect = self.anchor.map({ proxy[$0] }) {
                Rectangle()
                    .fill(Color.clear)
                    .border(Color.orange, width: 2)
                    .offset(x: rect.minX, y: rect.minY)
                    .frame(width: rect.width, height: rect.height)
            }
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
