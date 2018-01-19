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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.present(controller, animated: false, completion: nil)
    }
}
