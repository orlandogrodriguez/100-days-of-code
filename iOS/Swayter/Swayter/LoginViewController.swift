//
//  HomeViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/3/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import CoreLocation

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var thresholds = [TemperatureThreshold]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Facebook Login Button
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 20, y: view.frame.height / 2, width: view.frame.width - 40 , height: 44)
        loginButton.delegate = self
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook.")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        self.present(controller, animated: true, completion: nil)
        
        print("Successfully logged in with facebook.")
    }
    
}

