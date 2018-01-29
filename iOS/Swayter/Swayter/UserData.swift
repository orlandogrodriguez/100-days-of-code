//
//  UserData.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/27/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FBSDKCoreKit

class UserData {
    var units: String
    var thresholds: [TemperatureThreshold]
    var reminders: [Bool]
    var selectedHour: Int
    var selectedMinute: Int
    var firstName: String
    var lastName: String
    var locationServicesEnabled: Bool
    var pushNotificationsEnabled: Bool
    var dailyLow: Int
    
    init() {
        units = "F"
        reminders = [false, false, false, false, false, false, false]
        thresholds = []
        selectedHour = 8
        selectedMinute = 0
        firstName = "First Name"
        lastName = "Last Name"
        locationServicesEnabled = false
        pushNotificationsEnabled = false
        dailyLow = 0
    }
    
    func fetch() {
        print("Fetching user data from database.")
    }
    
    func printData() {
        print("###########################")
        print("User Data:")
        print("Units: \(units)")
        print("Reminders: \(units)")
        print("Thresholds: \(units)")
        print("Selected Minute: \(units)")
        print("Selected Hour: \(units)")
        print("First Name: \(units)")
        print("Last Name: \(units)")
        print("Location Services Enabled: \(units)")
        print("Push Notifications Enabled: \(units)")
        print("############################")
    }
}
