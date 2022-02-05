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
    //var tabBarController: UITabBarController { get }
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
        navigationController.pushViewController(loginViewController, animated: false)
        
        loginViewModel
            .$isUserLoggedIn
            .removeDuplicates()
            .subscribe(on: RunLoop.main)
            .sink { [weak self] isUserLoggedIn in
                guard let self = self else { return }
                
                if isUserLoggedIn {
                    print("**************************")
                    let friendsController = self.createFriendsController()
                    self.navigationController.pushViewController(friendsController, animated: true)
                } else {
                    self.navigationController.popToViewController(loginViewController, animated: true)
                }
            }
            .store(in: &cancellables)
    }
    
    private func createFriendsController() -> UIViewController {
        let ns = NetworkServiceImplimentation()
        let viewModel = FriendsViewModel(networkService: ns)
        let friendsView = FriendsView(viewModel: viewModel)
        return UIHostingController(rootView: friendsView)
    }
}

//class MainCoordinator: Coordinator {
//
//    let tabBarController: UITabBarController
////    let navigationController: UINavigationController
//    private let networkService = NetworkServiceImplimentation()
//    private let realmService = RealmServiceImplimentation()
//
//    private(set) var childCoordinators: [Coordinator] = []
//    var onCompleted: (() -> Void)?
//
//    private lazy var friendsViewModel = FriendsViewModel(networkService: networkService)
//    private lazy var groupsViewModel = GroupsViewModel(networkService: networkService, realmService: realmService)
//
//    //For disable and cleaning
//    private var cancellables: Set<AnyCancellable> = []
//
//    init(tabBarController: UITabBarController) {
////        let friendsView = FriendsView(viewModel: friendsViewModel)
////        let friendsViewController = UIHostingController(rootView: friendsView)
//
//        self.tabBarController = UITabBarController()
////        self.navigationController = UINavigationController(rootViewController: friendsViewController)
//    }
//
//    public func start() {
//        let mainTabVC = UIHostingController(rootView: MainView())
//
//
//        let friendsView = UIHostingController(rootView: FriendsView(viewModel: friendsViewModel))
//        let vc1 = UINavigationController(rootViewController: friendsView)
//
//        tabBarController.setViewControllers([vc1], animated: true)
//
////        friendsViewModel { [weak self] _ in
////            guard let self = self else { return }
////            if !isUserLoggedIn {
////                self.navigationController.popToRootViewController(animated: true)
////            } else {
////                let friendsView = self.FriendsView(viewModel: <#T##FriendsViewModel#>)
////                self.navigationController.pushViewController(friendsView, animated: true)
////            }
////        }.store(in: &cancellables)
//    }
//
////    private func createCitiesController() -> UIViewController {
////        let context = coreDataService.context
////        let citiesView = CitiesView().environment(\.managedObjectContext, context)
////        return UIHostingController(rootView: citiesView)
////    }
//}
