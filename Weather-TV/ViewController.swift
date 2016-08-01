//
//  ViewController.swift
//  Weather-TV
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
