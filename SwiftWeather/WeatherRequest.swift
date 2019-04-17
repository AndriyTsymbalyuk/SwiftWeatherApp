//
//  WeatherRequest.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 4/17/19.
//

import Foundation
import CoreLocation

class WeatherRequest {
    static let shared = WeatherRequest()
    private init() {}
    fileprivate let basePath = "https://api.darksky.net/forecast/6f6009bf8c44ddec879c06faf2369693/"
    func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
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

