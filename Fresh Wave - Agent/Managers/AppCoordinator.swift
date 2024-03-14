//
//  AppCoordinator.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 13/03/2024.
//

import UIKit
import Alamofire

class AppCoordinator {
    
    static let shared = AppCoordinator()
    
    private init() { initFont() }
    
    private func initFont() {
        let font = UIFont.systemFont(ofSize: 14)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
    
    func coordinate(window: UIWindow?) {
        window?.rootViewController = LaunchVC()
        window?.makeKeyAndVisible()
    }
    
    func reroute() {
      
        let isAuth = Preference.getBool(forKey: .isAuth)
        let isNewUser = Preference.getBool(forKey: .isNewUser)
        
        let root = isAuth ? (isNewUser ? CompleteProfileVC().embedInNav() : TabVC().embedInNav()) : LoginVC(viewModel: LoginViewModel(authModel: AuthModelImpl.shared)).embedInNav()
        UIWindow.switchRootView(root)
    }
    
    func restart() {
        let tab = TabVC().embedInNav()
        UIWindow.switchRootView(tab)
    }
}
