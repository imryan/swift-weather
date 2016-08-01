//
//  InterfaceController.swift
//  Weather-Watch Extension
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var weatherImageView: WKInterfaceImage!
    @IBOutlet weak var weatherLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        
        let location = CLLocation(latitude: 40.705280, longitude: -74.014025)
        
        ForecastKit.getWeatherForLocation(location) { (weather) in
            dispatch_async(dispatch_get_main_queue(), {
                self.weatherImageView.setImage(weather.icon)
                self.weatherLabel.setText("It is \(weather.temperature)˚F right now in NYC")
            })
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
