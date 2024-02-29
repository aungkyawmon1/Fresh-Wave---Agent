//
//  TabVC.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 22/02/2024.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpColors()
        setUpViewControllers()
    }
    
    private func setUpColors() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.dropShadow(opacity: 0.02, radius: 4, width: 0, height: -4)
        tabBar.tintColor = UIColor(named: "")
        tabBar.backgroundColor = .white
    }
      
    
    //Add viewModel References
    private func setUpViewControllers() {
        viewControllers?.removeAll()
    
        let home = HomeVC()
        let navHome = UINavigationController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let profile = ProfileVC(viewModel: ProfileViewModel())
        let navProfile = UINavigationController(rootViewController: profile)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 3)
        
        viewControllers = [navHome, navProfile]
        
    }

}
