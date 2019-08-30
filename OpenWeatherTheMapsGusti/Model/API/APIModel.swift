//
//  APIModel.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 28/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct UserModel {
    var cod : String?
    var message : Float?
    var cnt : Int?
    var list : [UserList]?
    
    init(json: JSON?) {
        self.cod = json?["cod"].string
        self.message = json?["message"].float
        self.cnt = json?["cnt"].int
        
        if let value = json?["list"].array {
            self.list = value.map { UserList(json: JSON($0.object))}
        }
    }
}


struct UserList {
    var dt : Int?
    var main : UserMain?
    var weather: [Userweather]?
    var clouds : Userclouds?
    var wind : UserWind?
    var rain : UserRain?
    var sys : UserSys?
    var dt_txt : String?
    
    init (json: JSON?) {
        self.dt = json?["dt"].int
        self.dt_txt = json?["dt_txt"].string
        
        if let value = json?["main"].dictionaryObject {
            let new = UserMain(json: JSON(value))
            self.main = new
        }
        if let value = json?["weather"].array {
            self.weather = value.map { Userweather(json: JSON($0.object))}
        }
        
        if let value = json?["clouds"].dictionaryObject {
            let new = Userclouds(json: JSON(value))
            self.clouds = new
        }
        
        if let value = json?["wind"].dictionaryObject {
            let new = UserWind(json: JSON(value))
            self.wind = new
        }
        
        if let value = json?["rain"].dictionaryObject {
            let new = UserRain(json: JSON(value))
            self.rain = new
        }
        
        if let value = json?["sys"].dictionaryObject {
            let new = UserSys(json: JSON(value))
            self.sys = new
        }
    }
    
}
struct UserMain {
    var temp : Double?
    var temp_min : Double?
    var temp_max : Double?
    var pressure : Double?
    var sea_level : Double?
    var grnd_level : Double?
    var humidity : Int?
    var temp_kf : Double?
    
    init(json: JSON?) {
        self.temp = json?["temp"].double
        self.temp_min = json?["temp_min"].double
        self.temp_max = json?["temp_max"].double
        self.pressure = json?["pressure"].double
        self.sea_level = json?["sea_level"].double
        self.grnd_level = json?["grnd_level"].double
        self.humidity = json?["humidity"].int
        self.temp_kf = json?["temp_kf"].double
        
    }
}

struct Userweather {
    var id : Int?
    var main : String?
    var description : String?
    var icon: String?
    
    init(json: JSON?) {
        self.id = json?["id"].int
        self.main = json?["main"].string
        self.description = json?["description"].string
        self.icon = json?["icon"].string
    }
}

struct Userclouds {
    var all: Int?
    
    init(json: JSON?) {
        self.all = json?["all"].int
    }
}

struct UserWind {
    var speed : Double?
    var deg : Float?
    
    init(json: JSON?) {
        self.speed = json?["speed"].double
        self.deg = json?["deg"].float
    }
}

struct UserRain {
    var h : Double?
    
    init(json: JSON?) {
        self.h = json?["3h"].double
      
    }
}

struct UserSys {
    var pod : String?
    
    init(json: JSON?) {
        self.pod = json?["pod"].string
    }
}


