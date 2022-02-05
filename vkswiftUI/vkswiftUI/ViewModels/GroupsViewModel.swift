//
//  GroupsViewModel.swift
//  vkswiftUI
//
//  Created by Home on 24.01.2022.
//

import SwiftUI
import RealmSwift

class GroupsViewModel: ObservableObject {
    private let networkService: NetworkService
    let realmService: RealmService
    
    private var notificationToken: NotificationToken?
    
    let objectWillChange = ObjectWillChangePublisher()
    
    private lazy var userGroups: Results<RealmGroup>? = try? realmService.get(RealmGroup.self)
    
    var error: Error?
    
    var fromRealmUserGroups: [UserGroup] { userGroups?.toArray().map{ UserGroup($0) } ?? [] }
    
    init(networkService: NetworkService, realmService: RealmService) {
        self.networkService = networkService
        self.realmService = realmService
        
        subscribeForDatabaseChanges()
    }
    
    func fetchGroups() {
        networkService.getGroups(completion: { [weak self] groupsItems in
            guard
                let self = self,
                let groupsItems = groupsItems?.items
            else { return }
            self.pushToRealm(groupsItems: groupsItems)
        })
    }
    
    //Загрузка данных в БД Realm
    fileprivate func pushToRealm(groupsItems: [UserGroup]) {
        //Преобразование в Realm модель
        let groupsItemsRealm = groupsItems.map({ RealmGroup($0) })
        //Загрузка
        do {
            let saveToDB = try realmService.update(groupsItemsRealm)
            print(saveToDB.configuration.fileURL?.absoluteString ?? "No avaliable file DB")
        } catch (let error) {
            print(error)
        }
    }
    
    private func subscribeForDatabaseChanges() {
        notificationToken = userGroups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
