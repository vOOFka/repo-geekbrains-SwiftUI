//
//  Friend.swift
//  vkswiftUI
//
//  Created by Home on 13.01.2022.
//

import UIKit

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let city: String
    let photos: [Photo]
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
        self.photos = Photo.getRandomPhotos()
    }
}

extension Friend {
    static let allFriends: [Friend] = {
        let friendsNameArray = ["Иванов Иван","Петров Петр","Ледова Катя","Медведева Мария","Илья Муромец","Алеша Попович","Борисов Борис","Матвей Смирнов","Гендальф Розовый","Брюс Уэйн","Умка Белый","Мария Чернышева","Богдан Яковлев","Артём Виноградов"]
        let friendsCityNameArray = ["Новороссийск", "Ричардсон", "Багума", "Тарма", "Черкесск", "Балаково", "Тобольск" ]
        
        return friendsNameArray.compactMap{ Friend(name: $0, city: friendsCityNameArray.randomElement()!) }
    }()
   
//    static func lettersFriends() -> [String] {
//        var array = friendsNameArray.map({ String($0.first!) })
//        array = Array(Set(array))
//        return array.sorted()
//    }
}
