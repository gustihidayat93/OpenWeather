//
//  SettingsController.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 27/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
//    MARK: Properties
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        if let username = username {
            print("Username is \(username)")
        } else {
            print("Username not found..")
        }
    }
    
//     MARK:  Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
//     MARK: funsi
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backspace-arrow").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
}
