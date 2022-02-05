//
//  MainView.swift
//  vkswiftUI
//
//  Created by Home on 15.01.2022.
//

import SwiftUI
import UIKit

//struct MainView: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> UITabBarController {
//        let tableCtrl = UITabBarController()
//        return tableCtrl
//    }
//
////    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
////
////    }
//
//    func makeCoordinator() -> () {
//        <#code#>
//    }
//
//}

struct MainView: View {
    let networkService = NetworkServiceImplimentation()
    let realmService = RealmServiceImplimentation()

    var body: some View {
        Text("MainView")
//        TabView {
//            FriendsView(viewModel: FriendsViewModel(networkService: networkService))
//                .tabItem {
//                    Label("Friends", systemImage: "person.2.fill")
//                }
//            GroupsView(viewModel: GroupsViewModel(networkService: networkService, realmService: realmService))
//                .tabItem {
//                    Label("Groups", systemImage: "person.3.fill")
//                }
//            NewsfeedView()
//                .tabItem {
//                    Label("Newsfeed", systemImage: "applelogo")
//                }
//        }
//        .navigationViewStyle(.columns)
//        .navigationBarTitle("", displayMode: .inline)
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
