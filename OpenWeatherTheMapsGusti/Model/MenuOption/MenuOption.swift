//
//  MenuOption.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 27/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "user") ?? UIImage()
        case .Inbox: return UIImage(named: "black-envelope") ?? UIImage()
        case .Notifications: return UIImage(named: "notifications-button") ?? UIImage()
        case .Settings: return UIImage(named: "settings-gears") ?? UIImage()
        }
    }
}
