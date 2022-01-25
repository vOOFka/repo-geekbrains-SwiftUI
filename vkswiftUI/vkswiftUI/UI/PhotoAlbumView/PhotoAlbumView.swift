//
//  PhotoAlbumView.swift
//  vkswiftUI
//
//  Created by Home on 14.01.2022.
//

import SwiftUI

struct PhotoAlbumView: View {
    var photos: [Photo]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(photos, id: \.self) { item in
                    Image(item.name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(Text("Photo album"))
    }
}

struct PhotoAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let photo = Photo.getRandomPhotos()
        
        PhotoAlbumView(photos: photo)
    }
}
