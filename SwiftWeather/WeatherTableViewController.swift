//
//  WeatherTableViewController.swift
//  SwiftWeather
//
// 
//

import UIKit
import CoreLocation
import GooglePlaces

class WeatherTableViewController: UITableViewController, UISearchBarDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var forecastData = [Weather]()
    var placesClient: GMSPlacesClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        placesClient = GMSPlacesClient.shared()

        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")

        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.loadGif(name: "giphy-7")
        self.tableView.backgroundView = imageView
        
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        getCurrentPlace()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            updateWeatherForLocation(location: locationString)
        }
    }
    
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            guard error == nil else {return}
            guard let location = placemarks?.first?.location  else {return}
            print(location.coordinate)
            Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                if let weatherData = results {
                    self.forecastData = weatherData
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        )}
    }
    
    func getCurrentPlace() {
        placesClient?.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    print(place.name)
                    print(place.coordinate)
                    Weather.forecast(withLocation: place.coordinate, completion: { (results:[Weather]?) in
                        if let weatherData = results {
                            self.forecastData = weatherData
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                )}
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return forecastData.count

    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("CustomHeaderView", owner: self, options: nil)?.first as? CustomHeaderView
        if let date = Calendar.current.date(byAdding: .day, value: section, to: Date()) {
            headerView?.headerTitle.text = FormaterManeger.shared.dateToString(date: date)
        }
        return  headerView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell {
            let weatherObject = forecastData[0].daily.data[indexPath.section]
            cell.summaryLabel.text = weatherObject.summary
            cell.temperatureLabel.text = "\(Int((5/9) * weatherObject.temperatureMax - 32)) °C"
            cell.sunsetLabel.text = "Sunset\n\(FormaterManeger.shared.doubleToString(weatherObject.sunsetTime))"
            cell.sunriseLabel.text = "Sunrise\n\(FormaterManeger.shared.doubleToString(weatherObject.sunriseTime))"
            cell.imageForCell.image = UIImage(named: weatherObject.icon)
            cell.pressureLabel.text = "Pressure\n\(weatherObject.pressure) mb"
            cell.windSpeedLabel.text = "Windspeed\n\(weatherObject.windSpeed) km/h"
            cell.humidityLabel.text = "Humidity\n\(weatherObject.humidity) %"
            cell.visabilityLabel.text = "Visibility\n\(weatherObject.visibility) km"
            cell.precipProbabilityLabel.text = "Precipitation\n\(weatherObject.precipProbability) %"
            
            return cell
        }
        return UITableViewCell()
    }
}

