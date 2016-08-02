//
//  InterfaceController.swift
//  Weather-Watch Extension
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var weatherImageView: WKInterfaceImage!
    @IBOutlet weak var weatherLabel: WKInterfaceLabel!
    
    let forecast = ForecastKit.sharedInstance
    
    // MARK: - View
    
    override func willActivate() {
        super.willActivate()
        
        forecast.getWeatherForLocation(ForecastKit.location) { (weather) in
            dispatch_async(dispatch_get_main_queue(), {
                self.weatherImageView.setImageNamed(weather.iconString)
                self.weatherLabel.setText("It is \(weather.temperature)˚F right now in NYC")
            })
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
