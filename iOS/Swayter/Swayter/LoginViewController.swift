//
//  HomeViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/3/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookCore
import CoreLocation
import FirebaseAuth


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var thresholds = [TemperatureThreshold]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Facebook Login Button
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: 44)
        
        loginButton.delegate = self
        
        if let accessToken = AccessToken.current {
            print("\n\n\nUser \(accessToken) already logged in...\n\n\n")
            
            DispatchQueue.main.async {
                print("moving to home.")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
                self.present(controller, animated: false, completion: nil)
            }
            
        } else {
            print("\n\nSomething happened\n\n")
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        self.present(controller, animated: false, completion: nil)
        
        print("Successfully logged in with facebook.")
    }
    
}

