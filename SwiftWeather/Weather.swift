//
//  Weather.swift
//  JSON
//
// 
//

import Foundation

struct Weather: Decodable {
    let daily: DailyData
}

struct DailyData: Decodable {
        let data: [ElementsDaily]
}

struct ElementsDaily: Decodable {
        let sunriseTime: Double
        let sunsetTime: Double
        let summary: String
        let temperatureMax: Double
        let icon: String
        let humidity: Double
        let pressure: Double
        let windSpeed: Double
        let visibility: Double
        let precipProbability: Double
        let time: Double
    }



 
