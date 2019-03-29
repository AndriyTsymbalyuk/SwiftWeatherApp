//
//  Weather.swift
//  JSON
//
// 
//

import Foundation
import CoreLocation

struct Weather: Decodable {
    let daily: DailyData

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

    static let basePath = "https://api.darksky.net/forecast/6f6009bf8c44ddec879c06faf2369693/"
    static func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
        guard  let url = URL(string: basePath + "\(location.latitude),\(location.longitude)") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            var forecastArray:[Weather] = []
            guard let response = response else {return}
            guard let data = data else {return}
            do {
                 let json = try JSONDecoder().decode(Weather.self, from: data)
                forecastArray.append(json)
            }catch {
                print(error)
            }
            completion(forecastArray)
            }.resume()
    }
}




            
//           
