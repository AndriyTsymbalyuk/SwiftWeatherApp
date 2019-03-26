//
//  CustomHeaderView.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 3/22/19.
//

import UIKit

class CustomHeaderView: UITableViewCell {
        
    @IBOutlet weak var headerTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
