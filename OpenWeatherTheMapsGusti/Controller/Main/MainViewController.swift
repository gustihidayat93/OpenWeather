//
//  MainViewController.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 26/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.sizeToFit()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.viewControllers = self.setupViews()
        
      
    }
    
    private func setupViews() -> [UIViewController] {
        let homeViewController = ContainerController()
        let magazine = UINavigationController(rootViewController: homeViewController)
        magazine.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "house-black-silhouette-without-door").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "house-black-silhouette-without-door (2)").withRenderingMode(.alwaysOriginal))
        magazine.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)], for: UIControl.State.selected)
        magazine.tabBarItem.tag = 1
        
        let hourlyForecastViewController = HourlyForecastViewController()
        let weathertimeline = UINavigationController(rootViewController: hourlyForecastViewController)
        weathertimeline.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "time-left (2)").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "time-left (1)").withRenderingMode(.alwaysOriginal))
        weathertimeline.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)], for: UIControl.State.selected)
        weathertimeline.tabBarItem.tag = 2
        
        
        
        
        let views = [magazine, weathertimeline].map{ UINavigationController(rootViewController: $0) }
        return views
    }
    
        
}


