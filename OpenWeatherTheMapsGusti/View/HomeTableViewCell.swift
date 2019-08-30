//
//  HomeTableViewCell.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 26/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var humadityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    
    
    
    var userList: UserList? {
        didSet {
            
            guard let userList = self.userList else { return }
            self.cloudsLabel.text = "\(self.userList?.clouds?.all ?? 0)"
            self.weatherLabel.text = self.userList?.weather?.first?.main
            self.humadityLabel.text = "\(self.userList?.main?.humidity ?? 0)"
            self.pressureLabel.text = "\(self.userList?.main?.pressure ?? 0)"
            self.speedLabel.text = "\(self.userList?.wind?.speed ?? 0)"
            self.directionLabel.text = "\(self.userList?.wind?.deg ?? 0)"
            
            if let temperatureInkelvin = self.userList?.main?.temp{
                let temperatureInCelcius = temperatureInkelvin - 273.15
                self.temperature.text = String(format: "%.0f", temperatureInCelcius)
            }
            
            if let temperatureInKelvin = self.userList?.main?.temp_min{
                let temperatureInCelcius = temperatureInKelvin - 273.15
                self.temperatureMinLabel.text = String(format: "%.0f", temperatureInCelcius)
                }
            
            if let temperatureInKelvin = self.userList?.main?.temp_max{
                let temperatureInCelcius = temperatureInKelvin - 273.15
                self.temperatureMaxLabel.text = String(format: "%.0f", temperatureInCelcius)
            }
            
            
                
        }
    }


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
