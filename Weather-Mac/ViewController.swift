//
//  ViewController.swift
//  Weather-Mac
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import Cocoa
import CoreLocation

class ViewController: NSViewController, CLLocationManagerDelegate {

    @IBOutlet weak var weatherImageView: NSImageView!
    @IBOutlet weak var weatherLabel: NSTextField!
    
    let forecast = ForecastKit.sharedInstance
    let locationManager = CLLocationManager()
    
    // MARK: - Location Delegate
    
    // MARK: - EXAMPLE CODE FLATIRON STUDENTS PRESENTS
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]) {
        let location = locations[0] as! CLLocation
        locationManager.stopUpdatingLocation()
        
        forecast.getWeatherForLocation(location) { (weather) in
            dispatch_async(dispatch_get_main_queue(), {
                self.weatherImageView.image = NSImage(named: weather.iconString)
                self.weatherLabel.stringValue = "It is \(weather.temperature)˚F right now in NYC"
            })
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location error: \(error)")
    }
    
    
    
    
    

    
    
    
    
    
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
