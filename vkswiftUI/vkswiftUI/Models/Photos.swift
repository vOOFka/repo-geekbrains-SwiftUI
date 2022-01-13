//
//  Photos.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import UIKit

struct Photos {
    let photo: UIImage?
    let likes: Int
    
    private static let photoArray = ["001","002","003","004","005","006","007","008","009","010"]
}

extension Photos {
    static func getRandomPhotos() -> [Photos] {
        var photos = [Photos]()
        for _ in (0...8) {
            let randomPhotoName = photoArray.randomElement()!
            guard let randomPhoto = UIImage(named: randomPhotoName) else { continue }
            photos.append(Photos(photo: randomPhoto, likes: 0))
        }
        return photos
    }
}
