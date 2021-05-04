//
//  ForecastTableViewCell.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/04/05.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let identifier = "ForecastTableViewCell"

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        
        backgroundColor = .clear
        statusLabel.textColor = .white
        temperatureLabel.textColor = statusLabel.textColor
        dateLabel.textColor = statusLabel.textColor
        timeLabel.textColor = statusLabel.textColor
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
