//
//  HomeViewController.swift
//  OpenWeatherTheMapsGusti
//
//  Created by Gusti Hidayat on 26/08/19.
//  Copyright © 2019 Gusti Hidayat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let cellId = "Cell"
private let url = "http://api.openweathermap.org/data/2.5/forecast?q=Jakarta&APPID=da13201d36831242cbc1d64dc1fa4c04"

class HomeViewController: UIViewController {
    
    var user: [UserModel]?
    var userList: [UserList]?
     var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setupComponent()
        fletchJson()
        
    }
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "WEATHER FORECAST"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu (3)").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func setupComponent() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    
    }

    func fletchJson() {
        DispatchQueue.main.async() {
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let users = UserModel(json: json)
//                catatan.. biasanya nurunin data disini, sekarang udah ditaruk di model..
//------------------------------------------------------------------------------------------
//                users.list?.forEach({ data in
//                    data.main?.temp
//                    data.main?.temp_min
//                    data.weather?.forEach({ weather in
//                            weather.id
//                        weather.main
//                    })
//                })
                if let item = users.list {
                    self.user = item.map({ UserModel(json: JSON($0.self)) })
                }
                self.userList = users.list
                self.tableView.reloadData()

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HomeTableViewCell else {
            fatalError("cell not found")}
        cell.userList = userList?[indexPath.row]
        let urlString = "http://openweathermap.org/img/wn/\(userList?[indexPath.row].weather?.first?.icon ?? "")@2x.png"
        if let url = URL(string: urlString) {
//            print(url, "CHECK URL")
            cell.iconImage.kf.setImage(with: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 600
    }
    
}
