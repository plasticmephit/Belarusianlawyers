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
            createNavController(for: LawyerViewControllerFilter(), title: NSLocalizedString("Фильтр", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: HomeViewController(), title: NSLocalizedString("Чат", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Карты", comment: ""), image: UIImage(systemName: "map")!)
        ]
    }
//    override func viewDidLayoutSubviews() {
//        tabBar.frame = CGRect(x: 0,y: UIScreen.main.bounds.height*0.85,width: UIScreen.main.bounds.width,height: tabBar.bounds.height +  view.frame.size.height/80 * 2)
//    }
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = view.frame.size.height/80
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY+20,
                width: width,
                height: height
            ),
            cornerRadius: height / 5
        )

        roundLayer.path = bezierPath.cgPath
       
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .blue
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        delegate
//        let app = UITabBarAppearance()
//               app.backgroundEffect = .none
//               tabBar.standardAppearance = app
        setupVCs()
//        setTabBarAppearance()
    }
}

