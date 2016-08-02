//
//  Weather.swift
//  Weather
//
//  Created by Ryan Cohen on 8/1/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

import Foundation

class Weather {
    
    var temperature: Double
    var iconString: String
    
    init(dictionary: NSDictionary) {
        self.temperature = dictionary["apparentTemperature"] as! Double
        self.iconString = dictionary["icon"] as! String
    }
}