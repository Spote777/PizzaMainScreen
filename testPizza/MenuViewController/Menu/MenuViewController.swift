//
//  MenuViewController.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
    }
    
    override func loadView() {
        super.loadView()
        
        view = menuView
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .lightGrayColor
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.leftBarButtonItem = .init(title: "Москва ∨", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

