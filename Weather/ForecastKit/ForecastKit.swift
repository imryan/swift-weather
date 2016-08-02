//
//  ForecastKit.swift
//  Weather
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import Alamofire
import CoreLocation

class ForecastKit: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = ForecastKit()
    static let location = CLLocation(latitude: 40.75921100, longitude: -73.98463800)
    
    func getWeatherForLocation(location: CLLocation, completion: (Weather) -> ()) {
        let url = "https://api.forecast.io/forecast/\(FORECAST_API_KEY)/\(location.coordinate.latitude),\(location.coordinate.longitude)"
        
        Alamofire.request(.GET, url).responseJSON { (response) in
            if let JSON = response.result.value {
                let weather = Weather.init(dictionary: JSON["currently"] as! NSDictionary)
                completion(weather)
            }
        }
    }
}