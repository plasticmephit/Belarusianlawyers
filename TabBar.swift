//
//  TabBar.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit



class TabBar: UITabBarController, UITabBarControllerDelegate {
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
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

    guard let fromView = selectedViewController?.view, let toView = viewController.view else {
      return false // Make sure you want this as false
    }

    if fromView != toView {
      UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
    }

    return true
}
    func setupVCs() {
        
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Главная", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: LawyerViewControllerFilter(), title: NSLocalizedString("Фильтр", comment: ""), image: UIImage(systemName: "slider.horizontal.3")!),
//            createNavController(for: HomeViewController(), title: NSLocalizedString("Чат", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Карты", comment: ""), image: UIImage(systemName: "map")!)
        ]
       
    }

//    override func viewDidLayoutSubviews() {
//        tabBar.frame = CGRect(x: 0,y: UIScreen.main.bounds.height*0.85,width: UIScreen.main.bounds.width,height: tabBar.bounds.height +  view.frame.size.height/80 * 2)
//    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        delegate = self
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
//        let app = UITabBarAppearance()
//               app.backgroundEffect = .none
//               tabBar.standardAppearance = app
       
        setupVCs()
       
    }
    @objc func showOfflineDeviceUI(notification: Notification) {
          
    }
}
