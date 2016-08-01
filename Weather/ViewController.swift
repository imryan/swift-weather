//
//  ViewController.swift
//  Weather
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!

    let locationManager = CLLocationManager()
    var locationNow = CLLocation()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //To Request Authorization
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        //Calls for location
        if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        }
        
        let location = CLLocation(latitude: 40.705280, longitude: -74.014025)
        
        ForecastKit.getWeatherForLocation(location) { (weather) in
            dispatch_async(dispatch_get_main_queue(), {
                self.weatherImageView.image = weather.icon
                self.weatherLabel.text = "It is \(weather.temperature)˚F right now in NYC"
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Delegate Method for location
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0] 
        let longitude = userLocation.coordinate.longitude;
        let latitude = userLocation.coordinate.latitude;
        self.locationNow = userLocation
        
        print(latitude, longitude)
        print(userLocation)
    }
}


