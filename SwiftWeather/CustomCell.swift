//
//  CustomCell.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 3/22/19.
//

import UIKit

    class CustomCell: UITableViewCell {
        @IBOutlet weak var sunsetLabel: UILabel!
        @IBOutlet weak var sunriseLabel: UILabel!
        @IBOutlet weak var imageForCell: UIImageView!
        @IBOutlet weak var temperatureLabel: UILabel!
        @IBOutlet weak var summaryLabel: UILabel!
        @IBOutlet weak var visabilityLabel: UILabel!
        @IBOutlet weak var windSpeedLabel: UILabel!
        @IBOutlet weak var humidityLabel: UILabel!
        @IBOutlet weak var pressureLabel: UILabel!
        @IBOutlet weak var precipProbabilityLabel: UILabel!
        
        override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

    
