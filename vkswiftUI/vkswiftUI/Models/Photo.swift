//
//  Photo.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import UIKit

struct Photo: Identifiable {
    let id = UUID()
    let photo: UIImage?
    let likes: Int
    
    private static let photoArray = ["001","002","003","004","005","006","007","008","009","010"]
}

extension Photo {
    static func getRandomPhotos() -> [Photo] {
        var photos = [Photo]()
        for _ in (0...8) {
            let randomPhotoName = photoArray.randomElement()!
            guard let randomPhoto = UIImage(named: randomPhotoName) else { continue }
            photos.append(Photo(photo: randomPhoto, likes: 0))
        }
        return photos
    }
}
