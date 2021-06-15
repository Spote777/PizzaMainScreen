//
//  TabBarController.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarItems()
        configureTabBar()
    }
    
    // MARK: - Methods
    
    private func configureTabBarItems() {
        viewControllers = [
            createMenuController(),
            createEmptyController(title: "Профиль", image: "profile"),
            createEmptyController(title: "Контакты", image: "contact"),
            createEmptyController(title: "Корзина", image: "shopping-cart")
        ]
    }
    
    private func createMenuController() -> UIViewController {
        let view = MenuViewController()
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.tabBarItem.title = "Меню"
        navigationController.tabBarItem.image = UIImage(named: "menu")
        return navigationController
    }
    
    private func createEmptyController(title: String, image: String) -> UIViewController {
        let view = EmptyViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = UIImage(named: image)
        return view
    }
    
    func configureTabBar() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .grayColor
        tabBar.tintColor = .redColor
    }
}
