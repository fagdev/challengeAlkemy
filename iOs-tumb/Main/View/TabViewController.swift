//
//  TabViewController.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 15/09/2021.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Primera
        
        let firstTabTitle = "Popular Movies"
        let firstTabImage = UIImage(systemName: "list.dash")
        
        let firstTabViewController = FirstViewController(nibName: "FirstViewController", bundle: nil)
        firstTabViewController.title = "Popular Movies"
        
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
        //Segunda
        
        let secondTabTitle = "Favorites"
        let secondTabImage = UIImage(systemName: "heart")
        
        let secondTabViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
        secondTabViewController.title = "Favorites"
        
        let secondTabNavigationController = UINavigationController(rootViewController: secondTabViewController)
        
        secondTabNavigationController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)
        
        // armo el array
        
        viewControllers = [firstTabNavigationController, secondTabNavigationController]
        
        
    }


}
