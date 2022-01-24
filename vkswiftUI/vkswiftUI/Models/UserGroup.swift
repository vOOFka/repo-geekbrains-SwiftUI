//
//  UserGroup.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import UIKit

class Groups: Decodable {
    let items: [UserGroup]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    enum ItemsKeys: String, CodingKey {
        case items
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let itemsContainer = try container.nestedContainer(keyedBy: ItemsKeys.self, forKey: .response)
        self.items = try itemsContainer.decode([UserGroup].self, forKey: .items)
    }
}

class UserGroup: Identifiable, Decodable {
    var id: Int = 0
    var name: String = ""
    var isMember: Int = 1
    var urlPhoto: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id,name
        case isMember = "is_member"
        case urlPhoto = "photo_100"
    }
    init() {}
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.isMember = try container.decode(Int.self, forKey: .isMember)
        self.urlPhoto = try container.decode(String.self, forKey: .urlPhoto)
    }
}

//import SwiftUI
//
//struct UserGroup: Identifiable {
//    let id = UUID()
//    let name: String
//    let image: UIImage?
//
//    init(name: String) {
//        self.name = name
//        self.image = UIImage(named: name)
//    }
//}
//
//extension UserGroup {
//    private static let userGroupsNames = ["Автолюбители", "Гринпис", "Greenpeace", "Очень-очень длинное название группы с фантастическими видео"]
//    private static let aveliableGroupsNames = ["Библиофилы", "Программисты IOS", "Готовим вкусно!", "Автолюбители", "Гринпис", "Greenpeace", "Очень-очень длинное название группы с фантастическими видео"]
//
//    static let userGroups: [UserGroup] = userGroupsNames.compactMap{ UserGroup(name: $0) }
//    static let aveliableGroups: [UserGroup] = aveliableGroupsNames.compactMap{ UserGroup(name: $0) }
//}
