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
import FirebaseAuth


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
//    var thresholds = [TemperatureThreshold]()
//    var units = "F"
//    
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom Facebook Button
        let customFacebookLoginButton = UIButton(type: .system)
        customFacebookLoginButton.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        customFacebookLoginButton.frame = CGRect(x: 0, y: view.frame.height / 2 - 32, width: view.frame.width, height: 64)
        customFacebookLoginButton.setTitle("Sign In With Facebook", for: .normal)
        customFacebookLoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        customFacebookLoginButton.setTitleColor(.white, for: .normal)
        view.addSubview(customFacebookLoginButton)
        
        customFacebookLoginButton.addTarget(self, action: #selector(handleCustomFacebookLogin), for: .touchUpInside)
        
        // Automatic Log In
        if let accessToken = AccessToken.current {

            DispatchQueue.main.async {
                print("User is already logged in. Proceeding to home page.")
                self.moveToHomeVC()
            }
        } else {
            print("\n\nSomething happened\n\n")
        }
        
    }
    
    @objc func handleCustomFacebookLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, err) in
            if err != nil {
                print("Custom Facebook Login Failed.")
                return
            }
            self.moveToHomeVC()
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
        moveToHomeVC()
        print("Successfully logged in with facebook.")
    }
    
    func moveToHomeVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        self.present(controller, animated: false, completion: nil)
    }
    
}

