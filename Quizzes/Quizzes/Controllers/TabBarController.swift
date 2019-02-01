//
//  TabBarController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTabBar()
    
  }
  
  private func setupTabBar() {
    
    let quizTabBarController = QuizzesController()
    
    quizTabBarController.tabBarItem = UITabBarItem(title: "Quizzes", image: UIImage(named: "quizzes"), tag: 0)
    
    let searchTabBarController = SearchController()
    searchTabBarController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
    
    let createTabBarController = CreateController()
    createTabBarController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "create"), tag: 2)
    
    let profileTabBarController = ProfileController()
    profileTabBarController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
    
    let tabBarList = [UINavigationController(rootViewController: quizTabBarController),
                      UINavigationController(rootViewController: searchTabBarController),
                      UINavigationController(rootViewController: createTabBarController),
                      UINavigationController(rootViewController: profileTabBarController)]
    
    viewControllers = tabBarList
  }
  
  
  
}
