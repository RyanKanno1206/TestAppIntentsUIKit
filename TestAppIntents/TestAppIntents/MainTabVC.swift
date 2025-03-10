//
//  ViewController.swift
//  TestAppIntents
//
//  Created by Ryan Kanno on 2/27/25.
//

import UIKit

class MainTabVC: UITabBarController {
    // MARK: -  Tab 1
    private let tabItem1 = UITabBarItem(
        title: "Home",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house.fill"))
    
    private(set) lazy var root1: UINavigationController = {
        let vc = UINavigationController(rootViewController: tab1)
        vc.tabBarItem = tabItem1
        return vc
    }()
    
    private(set) lazy var tab1: Tab1VC = {
        let vc = Tab1VC()
        vc.view.backgroundColor = .blue
        return vc
    }()
    
    // MARK: - Tab 2
    private let tabItem2 = UITabBarItem(
        title: "Profile",
        image: UIImage(systemName: "person.circle"),
        selectedImage: UIImage(systemName: "person.circle.fill"))
    
    private(set) lazy var root2: UINavigationController = {
        let vc = UINavigationController(rootViewController: tab2)
        vc.tabBarItem = tabItem2
        return vc
    }()
    
    private(set) lazy var tab2: UIViewController  = {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }()
    
    private(set) lazy var vcs = [root1, root2]

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = vcs
        selectedIndex = 0
        tabBar.barStyle = .default
        tabBar.isTranslucent = false
    }


}

