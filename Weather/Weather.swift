//
//  Weather.swift
//  Weather
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    var temperature: Double
    var icon: UIImage = UIImage.init()
    
    init(dictionary: NSDictionary) {
        self.temperature = dictionary["apparentTemperature"] as! Double
        self.icon = iconToImage(dictionary["icon"] as! String)
    }
}

extension Weather {
    
    // icon names:
    // clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy,
    // partly-cloudy-day, partly-cloudy-night, hail, thunderstorm, tornado
    
    func iconToImage(icon: String) -> UIImage {
        if let image = UIImage(named: icon) {
            return image
        } else {
            return UIImage()
        }
    }
}