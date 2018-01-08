//
//  ViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/2/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var thresholds = [TemperatureThreshold]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dummy temperature thresholds for testing:
        fetchThresholds(uid: "12345")
        
    }
    
    func fetchThresholds(uid: String) {
        //TODO: get thresholds from firebase and add to thresholds array.
        fetchTestThresholds()   //Remove this upon completing firebase implementation.
    }
    
    func fetchTestThresholds() {
        var threshold0 = TemperatureThreshold.init(name: "Sweater", temperature: 68)
        var threshold1 = TemperatureThreshold.init(name: "Jacket", temperature: 57)
        var threshold2 = TemperatureThreshold.init(name: "Winter Jacket", temperature: 50)
        thresholds.append(threshold0)
        thresholds.append(threshold1)
        thresholds.append(threshold2)
    }
}
