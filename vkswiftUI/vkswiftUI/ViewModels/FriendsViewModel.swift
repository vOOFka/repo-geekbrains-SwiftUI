//
//  FriendsViewModel.swift
//  vkswiftUI
//
//  Created by Home on 24.01.2022.
//

import Foundation
import SwiftUI

class FriendsViewModel: ObservableObject {

    @Published var friendsCategory = [FriendsCategory]()
    private var friendsCategoryDictionary = [String : [Friend]]()
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchFriends() {
        networkService.getFriends(completion: { [weak self] friendsItems in
            guard
                let self = self,
                let friendsItems = friendsItems?.items
            else { return }
            self.friendsCategory.removeAll()
            self.friendsCategoryDictionary.removeAll()

            self.friendsCategoryDictionary = Dictionary(grouping: friendsItems) { $0.category }
            for (_, value) in self.friendsCategoryDictionary.enumerated() {
                let category = FriendsCategory(category: value.key, array: value.value)
                self.friendsCategory.append(category)
            }
            self.friendsCategory.sort(by: { $0.category < $1.category })
        })
    }
}
