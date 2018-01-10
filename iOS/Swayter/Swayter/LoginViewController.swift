//
//  LoginViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/3/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import CoreLocation
import Alamofire

struct Forecast: Decodable {
    let daily: DailyForecast
}

struct DailyForecast: Decodable {
    let summary: String
    let icon: String
    let data: [DailyData]
}

struct DailyData: Decodable {
    let temperatureLow: Double
}

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let darkSkyApiKey = "1d9fa591049c0c502bd0e4f3f3d3c2c9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Facebook Login Button
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 20, y: view.frame.height / 2, width: view.frame.width - 40 , height: 44)
        loginButton.delegate = self
        
        // Location Manager
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\n\nlocationManager\n\n")
        var currentLatitude: Double
        var currentLongitude: Double
        var urlString: String
        if let location = locations.first {
            // Acquire Coordinates
            currentLatitude = location.coordinate.latitude
            currentLongitude = location.coordinate.longitude
            
            // Generate String for API Call
            urlString = "https://api.darksky.net/forecast/\(darkSkyApiKey)/\(currentLatitude),\(currentLongitude)"
            guard let url = URL(string: urlString) else { return }
            
            // Hit API
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                guard let data = data else { return }
                do {
                    
                    // JSON Parsing
                    let forecast = try JSONDecoder().decode(Forecast.self, from: data)
                    let daily = forecast.daily
                    let dailyData = daily.data
                    let temperatureLow = dailyData[0].temperatureLow
                    
                    print("Today's Low Temperature: \(temperatureLow)")
                    
                } catch let jsonErr {
                    print("error serializing json: ", jsonErr)
                }
            }.resume()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook.")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("Successfully logged in with facebook.")
    }
}
