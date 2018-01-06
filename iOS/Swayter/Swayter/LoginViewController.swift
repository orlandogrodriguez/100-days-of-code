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
        var url: String
        if let location = locations.first {
            currentLatitude = location.coordinate.latitude
            currentLongitude = location.coordinate.longitude
            url = "https://api.darksky.net/forecast/\(darkSkyApiKey)/\(currentLatitude),\(currentLongitude)"
            
            Alamofire.request(url).responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
            }
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
