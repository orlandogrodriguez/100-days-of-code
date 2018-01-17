//
//  HomeViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/2/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import CoreLocation

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

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let darkSkyApiKey = "1d9fa591049c0c502bd0e4f3f3d3c2c9"
    
    var lowTemperatureForecast: Double = -273.00 {
        didSet {
            print("lowTemperatureForecast: \(self.lowTemperatureForecast)")
            DispatchQueue.main.async {
                self.updateLowTemperatureLabel()
            }
        }
    }
    
    //UI
    let animationDuration = 0.1
    
    @IBOutlet weak var poweredByDarkSky: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var hamburgerButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notificationsButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var newThresholdButton: UIButton!
    
    @IBOutlet weak var backgroundBlur: UIView!
    
    @IBAction func hamburgerButtonPress(_ sender: Any) {
        enableMenuButtons()
        
    }
    
    @IBAction func homeButtonPress(_ sender: Any) {
        disableMenuButtons()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Location Manager
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        disableMenuButtons()
        setUpBackgroundBlur()
        
    }
    
    func disableMenuButtons() {
        
        homeButton.isHidden = true
        homeButton.isEnabled = false
        hamburgerButton.isHidden = false
        hamburgerButton.isEnabled = true
        
        profileButton.isEnabled = false
        notificationsButton.isEnabled = false
        newThresholdButton.isEnabled = false
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: {
            self.profileButton.transform = CGAffineTransform.identity
            self.notificationsButton.transform = CGAffineTransform.identity
            self.newThresholdButton.transform = CGAffineTransform.identity
            
            self.backgroundBlur.alpha = 0
            
        },completion: { (true) in
            self.profileButton.isHidden = true
            self.notificationsButton.isHidden = true
            self.newThresholdButton.isHidden = true
        })
    }
    
    func enableMenuButtons() {
        
        let displacement: CGFloat = 100.0
        let diagonalDisplacement: CGFloat = 70.71067
        
        homeButton.isHidden = false
        homeButton.isEnabled = true
        
        hamburgerButton.isHidden = true
        hamburgerButton.isEnabled = false
        
        self.profileButton.isHidden = false
        self.notificationsButton.isHidden = false
        self.newThresholdButton.isHidden = false
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: {
            self.profileButton.transform = CGAffineTransform(translationX: displacement * -1, y: 0)
            self.notificationsButton.transform = CGAffineTransform(translationX: diagonalDisplacement * -1, y: diagonalDisplacement * -1)
            self.newThresholdButton.transform = CGAffineTransform(translationX: 0, y: displacement * -1)
            
            self.backgroundBlur.alpha = 1
            
        }) { (true) in
            self.profileButton.isEnabled = true
            self.notificationsButton.isEnabled = true
            self.newThresholdButton.isEnabled = true
        }
        
    }
    
    func setUpBackgroundBlur() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            
            
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = backgroundBlur.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            backgroundBlur.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            backgroundBlur.backgroundColor = .black
        }
    }
    
    func updateLowTemperatureLabel() {
        self.lowTemperatureLabel.text = "\(self.lowTemperatureForecast)ºF"
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
                    self.lowTemperatureForecast = temperatureLow
                    
                    print("Today's Low Temperature: \(temperatureLow)")
                    self.updateLowTemperatureLabel()
                    
                } catch let jsonErr {
                    print("error serializing json: ", jsonErr)
                }
            }.resume()
            
        }
    }
}
