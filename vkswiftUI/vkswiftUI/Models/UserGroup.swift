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
    init(_ realmModel: RealmGroup) {
        self.id = realmModel.id
        self.name = realmModel.name
        self.isMember = realmModel.isMember
        self.urlPhoto = realmModel.urlAvatar ?? ""
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.isMember = try container.decode(Int.self, forKey: .isMember)
        self.urlPhoto = try container.decode(String.self, forKey: .urlPhoto)
    }
}
