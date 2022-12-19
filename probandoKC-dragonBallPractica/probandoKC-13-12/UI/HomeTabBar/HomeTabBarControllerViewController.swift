//
//  HomeTabBarControllerViewController.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 13/12/22.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
    }
    
    private func setupTabs(){
        let navigationController = UINavigationController(rootViewController: TableViewController())
       
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController.tabBarItem = UITabBarItem(title: "TableView", image: tabImage, tag: 0)
        
        let collectionViewController = CollectionViewController()
        let tabImg = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        collectionViewController.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImg, tag: 1)
        
        
        viewControllers = [navigationController, collectionViewController]
        
        
        
    }
    private func setupLayout() {
        tabBar.backgroundColor = .systemBackground
    }

}
