//
//  MainViewCoordinator.swift
//  vkswiftUI
//
//  Created by Home on 04.02.2022.
//

import UIKit
import Combine
import SwiftUI

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get }
    var onCompleted: (() -> Void)? { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private var cancellables: Set<AnyCancellable> = []
    
    let navigationController: UINavigationController
    var onCompleted: (() -> Void)?
    
    let loginViewModel: LoginViewModel = LoginViewModel()
    
    let networkService = NetworkServiceImplimentation()
    let realmService = RealmServiceImplimentation()
    
    public init(navigationController: UINavigationController, onCompleted: (() -> Void)? = nil) {
        self.navigationController = navigationController
        self.onCompleted = onCompleted
    }
    
    func start() {
        let loginViewBinding = Binding<Bool>.init { [weak self] in
            guard let self = self else { return false }
            return self.loginViewModel.isUserLoggedIn
        } set: { [weak self] newValue in
            guard let self = self else { return }
            self.loginViewModel.isUserLoggedIn = newValue
        }
        
        let loginView = LoginVKView(isAuthorized: loginViewBinding)
        let loginViewController = UIHostingController(rootView: loginView)
        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(loginViewController, animated: false)
        
        loginViewModel
            .$isUserLoggedIn
            .removeDuplicates()
            .subscribe(on: RunLoop.main)
            .sink { [weak self] isUserLoggedIn in
                guard let self = self else { return }
                
                if isUserLoggedIn {
                    let tabBarVC = self.createTabBarController()
                    tabBarVC.modalPresentationStyle = .fullScreen
                    self.navigationController.present(tabBarVC, animated: true, completion: nil)
                } else {
                    self.navigationController.popToViewController(loginViewController, animated: true)
                }
            }
            .store(in: &cancellables)
    }
    
    private func createTabBarController() -> UIViewController {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: createFriendsController())
        let vc2 = UINavigationController(rootViewController: createGroupsController())
        let vc3 = UINavigationController(rootViewController: createNewsfeedController())
        
        vc1.title = "Friends"
        vc2.title = "Groups"
        vc3.title = "Newsfeed"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: true)
        
        guard let items = tabBarVC.tabBar.items else { return tabBarVC }
        let imageNames = ["person.2.fill","person.3.fill","applelogo"]
        
        for x in 0..<imageNames.count {
            items[x].image = UIImage(systemName: imageNames[x])
        }
        
        return tabBarVC
    }
    
    private func createFriendsController() -> UIViewController {
        let viewModel = FriendsViewModel(networkService: networkService)
        let friendsView = FriendsView(viewModel: viewModel)
        return UIHostingController(rootView: friendsView)
    }
    private func createGroupsController() -> UIViewController {
        let viewModel = GroupsViewModel(networkService: networkService, realmService: realmService)
        let groupsView = GroupsView(viewModel: viewModel)
        return UIHostingController(rootView: groupsView)
    }
    private func createNewsfeedController() -> UIViewController {
        let newsfeedView = NewsfeedView()
        return UIHostingController(rootView: newsfeedView)
    }
}
