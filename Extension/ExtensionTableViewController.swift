//
//  ExtensionTableViewController.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 3/30/19.
//

import Foundation
import UIKit

extension UITableViewController {
    
   public func loadBackgroundGiphy (name: String) {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.loadGif(name: name)
        self.tableView.backgroundView = imageView
        
    }
}
