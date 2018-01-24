//
//  PopupViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/24/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    var thresholds: [TemperatureThreshold] = []
    var previousVC: UIViewController?
    var index: Int?
    
    @IBOutlet weak var thresholdNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(thresholds)
        
        thresholdNameTextField.becomeFirstResponder()
        
        
    }
    
    @IBAction func cancelNameEdit(_ sender: UIButton) {
        thresholdNameTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func acceptNameEdit(_ sender: UIButton) {
        var pvc = previousVC as? ThresholdsViewController

        pvc?.thresholds[index!].name = thresholdNameTextField.text ?? "New Threshold"
        pvc?.clearThresholdsUI()
        pvc?.refreshThresholdsUI(count: thresholds.count)
        
        thresholdNameTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        thresholdNameTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
}
