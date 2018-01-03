//
//  TemperatureThreshold.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/2/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import Foundation

struct TemperatureThreshold {
    
    // Instance Properties
    var name: String
    var temperature: Int
    
    // Class Variables
    static let minimumTemperature: Int = -128
    static let maximumTemperature: Int = 128
    
    // Initializers
    init() {
        name = "Clothing Layer"
        temperature = 70
    }
    
    init(name: String, temperature: Int) {
        self.name = name
        self.temperature = temperature
    }
    
    // Getters and Setters
    var threshold: Int {
        get {
            return temperature
        }
        set {
            temperature = newValue
        }
    }
    
}
