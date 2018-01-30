//
//  ProfileViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/18/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileViewController: UIViewController {
    
    var units: String?
    var userData = UserData()
    
    @IBOutlet weak var unitsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unitsButton.setTitle(userData.units, for: .normal)
        
        let logoutButton = UIButton(type: .system)
        logoutButton.backgroundColor = UIColor(red: 246/255, green: 71/255, blue: 71/255, alpha: 1.0)
        logoutButton.frame = CGRect(x: 0, y: view.frame.height - 104 - 64, width: view.frame.width, height: 44)
        logoutButton.setTitle("Sign Out", for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logoutButton.setTitleColor(.white, for: .normal)
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
    }
    
    @objc func handleLogOut() {
        let manager = FBSDKLoginManager()
        manager.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func unitsButtonPress(_ sender: UIButton) {
        if userData.units == "F" {
            userData.units = "C"
        } else {
            userData.units = "F"
        }
        unitsButton.setTitle(userData.units, for: .normal)
    }
    
    
    @IBAction func homeButtonPress(_ sender: UIButton) {
        proceedToHome()
    }
    
    func updateDatabase() {
        print("Updating database...")
    }
    
    func proceedToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
        print("Units: \(userData.units)")
        controller?.userData = userData
        controller?.modalTransitionStyle = .crossDissolve
        updateDatabase()
        present(controller!, animated: true, completion: nil)
    }
}
