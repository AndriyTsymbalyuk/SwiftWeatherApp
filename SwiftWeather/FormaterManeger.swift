//
//  DateFormater.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 3/22/19.
//

import Foundation

 struct FormaterManeger {
   
    static func doubleToString(_ value: Double) -> String {
        let date = Date(timeIntervalSince1970: value)
        let format = DateFormatter()
        format.timeStyle = .short
        let stringFromDate = format.string(from: date)
        return stringFromDate
    }
    
    static func convertToTime(value: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        guard let formattedString = formatter.string(from: TimeInterval(value)) else {return "no value"}
        return formattedString
    }
    
    static func dateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
}
    
}
