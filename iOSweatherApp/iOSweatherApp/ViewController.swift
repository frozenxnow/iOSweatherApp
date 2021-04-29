//
//  ViewController.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/04/04.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let location = CLLocation(latitude: 37.498206, longitude: 127.02861)
        WeatherDataSource.shared.fetch(location: location) {
            self.listTableView.reloadData()
            print("location update")
        }
        
    }


}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell", for: indexPath) as! SummaryTableViewCell
            
//            if let weather = WeatherDataSource.shared.summary?.weather.first, let main = WeatherDataSource.shared.summary?.main  {
//                cell.weatherImageView.image = UIImage(named: weather.icon)
//                cell.statusLabel.text = weather.description
//                cell.minMaxLabel.text = "최고 \(main.temp_max)º / 최소 \(main.temp_min)º"
//                cell.currentTemperatureLabel.text = "\(main.temp)º"
//            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell", for: indexPath) as! ForecastTableViewCell
            return cell
        }
        
    }
    
    
}
