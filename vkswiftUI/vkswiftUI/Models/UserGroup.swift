//
//  UserGroup.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI

struct UserGroup: Identifiable {
    let id = UUID()
    let name: String
    let image: UIImage?
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)
    }    
}
    
extension UserGroup {
    private static let userGroupsNames = ["Автолюбители", "Гринпис", "Greenpeace", "Очень-очень длинное название группы с фантастическими видео"]
    private static let aveliableGroupsNames = ["Библиофилы", "Программисты IOS", "Готовим вкусно!", "Автолюбители", "Гринпис", "Greenpeace", "Очень-очень длинное название группы с фантастическими видео"]
    
    static let userGroups: [UserGroup] = userGroupsNames.compactMap{ UserGroup(name: $0) }
    static let aveliableGroups: [UserGroup] = aveliableGroupsNames.compactMap{ UserGroup(name: $0) }
}
