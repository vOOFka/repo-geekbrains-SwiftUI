//
//  PhotoAlbumViewModel.swift
//  vkswiftUI
//
//  Created by Home on 24.01.2022.
//

import Foundation
import SwiftUI

class PhotoAlbumViewModel: ObservableObject {
    
    @Published var photosItems = [Photo]()
    var currentFriend = Friend()
    private let networkService: NetworkService
    
    init(friend: Friend, networkService: NetworkService) {
        self.currentFriend = friend
        self.networkService = networkService
    }
    
    func fetchPhotos() {
        networkService.getPhotosAll(friendId: currentFriend.id, completion: { [weak self] photosItems in
            guard
                let self = self,
                let photosItems = photosItems?.items
            else { return }
            
            self.photosItems = photosItems
        })
    }
}
