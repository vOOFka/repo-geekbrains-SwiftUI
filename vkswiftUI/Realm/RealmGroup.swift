//
//  RealmGroup.swift
//  vkontakteVS
//
//  Created by Home on 14.09.2021.
//

import UIKit
import RealmSwift

class RealmGroup: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var isMember: Int = 1
    @Persisted var urlAvatar: String?

    convenience init(_ groupModel: UserGroup) {
        self.init()
        self.id = groupModel.id
        self.name = groupModel.name
        self.isMember = groupModel.isMember
        self.urlAvatar = groupModel.urlPhoto
    }
}
