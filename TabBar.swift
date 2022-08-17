//
//  TabBar.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit


let myNotificationKey = "com.bobthedeveloper.notificationKey"
let myNotificationKey2 = "com.bobthedeveloper.notificationKey2"
class TabBar: UITabBarController {
    

    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true
//        rootViewController.navigationItem.title = title
        return navController
    }
    func setupVCs() {
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Главная", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: LawyerViewController(), title: NSLocalizedString("Фильтр", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: HomeViewController(), title: NSLocalizedString("Чат", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Карты", comment: ""), image: UIImage(systemName: "map")!)
        ]
    }
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
        
    }
}

