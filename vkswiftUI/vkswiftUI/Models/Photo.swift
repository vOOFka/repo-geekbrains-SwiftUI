//
//  Photo.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import UIKit

class Photos: Decodable {
    let items: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    enum ItemsKeys: String, CodingKey {
        case items
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let itemsContainer = try container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .response)
        self.items = try itemsContainer.decode([Photo].self, forKey: .items)
    }
}

class Photo: Decodable, Identifiable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        lhs.id == rhs.id ? true : false
    }
    
    var id: Int = 0
    var albumId: Int = 0
    var ownerId: Int = 0
    var text: String?
    var date: Int = 0
    var sizes = [sizePhoto]()
    var likes: Int? = 0
    var userLikes: Bool = false
    var reposts: Int? = 0
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case ownerId = "owner_id"
        case text
        case date
        case sizes
        case likes
        case reposts
    }
    enum LikesKeys: String, CodingKey {
        case likes = "count"
        case userLikes = "user_likes"
    }
    enum RepostsKeys: String, CodingKey {
        case reposts = "count"
    }
    init() {}
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.albumId = try container.decode(Int.self, forKey: .albumId)
        self.ownerId = try container.decode(Int.self, forKey: .ownerId)
        self.text = try? container.decode(String.self, forKey: .text)
        self.date = try container.decode(Int.self, forKey: .date)
        self.sizes = try container.decode([sizePhoto].self, forKey: .sizes)
        //Likes
        let likesContainer = try? container.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.likes = try likesContainer?.decode(Int.self, forKey: .likes)
        self.userLikes = try {
            guard let like = try likesContainer?.decode(Int.self, forKey: .userLikes) else { return false }            
            return like == 1 ? true : false
        }()
        //Reposts
        let repostsContainer = try? container.nestedContainer(keyedBy: RepostsKeys.self, forKey: .reposts)
        self.reposts = try repostsContainer?.decode(Int.self, forKey: .reposts)
    }
}

enum sizeType: String, Decodable {
    case small = "s"
    case mid = "m"
    case max = "x"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case l = "l"
    case xmax = "y"
    case xxmax = "z"
    case xxxmax = "w"
}

class sizePhoto: Decodable {
    var height: Int = 1
    var width: Int = 1
    var type = sizeType.max
    var urlPhoto: String = ""
    var image: UIImage?
    var ratio: CGFloat { CGFloat(self.height)/CGFloat(self.width) }
    
    enum CodingKeys: String, CodingKey {
        case height
        case width
        case type
        case urlPhoto = "url"
    }
    init() {}
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decode(Int.self, forKey: .height)
        self.width = try container.decode(Int.self, forKey: .width)
        self.type = sizeType(rawValue: try container.decode(sizeType.RawValue.self, forKey: .type)) ?? sizeType.max
        self.urlPhoto = try container.decode(String.self, forKey: .urlPhoto)
    }
}
