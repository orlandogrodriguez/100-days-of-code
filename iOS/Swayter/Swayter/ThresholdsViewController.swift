//
//  ThresholdsViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/20/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit

class ThresholdsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emptyThresholdsLabel: UILabel!
    
//    var emptyThresholdsLabel: UILabel = UILabel()
    
//    var thresholds: [TemperatureThreshold] = []
    
    var nameLabels: [UILabel] = []
    var temperatureLabels: [UILabel] = []
    var thresholdViews: [UIView] = []
    var temperatureChangeButtons: [UIButton] = []
    
    let scrollView = UIScrollView()
    
    var currentEditIndex: Int?
    
    var userData = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchThresholds()
        
        let svHeight = Int((view.frame.height - 104) - (titleLabel.frame.maxY + 44))
        scrollView.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 44, width: view.frame.width, height: CGFloat(svHeight))
        scrollView.contentSize = CGSize(width: Int(view.frame.width), height: 120 * userData.thresholds.count)

        view.addSubview(scrollView)
        refreshThresholdsUI(count: userData.thresholds.count)
    }
    
    func generateThresholdViewElement(index: Int) {
        
        let maxW = view.frame.width
        let midW = maxW / 2
        let maxH = view.frame.height
        let midH = maxH / 2
        
        //let startY = titleLabel.frame.maxY + 44
        let startY = self.scrollView.frame.minY
        
        let thresholdH = 100
        let gap = 20
        let thresholdW = Int(view.frame.width)
        
        //let thresholdY = Int(startY) + (index * thresholdH) + (index * gap)
        let thresholdY = (index * thresholdH) + (index * gap)
        
        let buttonW = 44
        let buttonH = 44
        
        let buttonY = thresholdY + (thresholdH / 2 - buttonH / 2)
        
        
        let thresholdView = UIView(frame: CGRect(x: 0, y: thresholdY, width: thresholdW, height: thresholdH))
        thresholdView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        thresholdViews.append(thresholdView)
        
        //edit
        self.scrollView.addSubview(thresholdView)
        
        
        // Threshold Buttons
        let decreaseBtn = DecreaseThresholdButton(index: index)
        decreaseBtn.frame = CGRect(x: 20, y: buttonY, width: buttonW, height: buttonH)
        decreaseBtn.setBackgroundImage(#imageLiteral(resourceName: "LessButton"), for: .normal)
        decreaseBtn.addTarget(self, action: #selector(decreaseThreshold), for: .touchUpInside)
        //edit
        temperatureChangeButtons.append(decreaseBtn)
        self.scrollView.addSubview(decreaseBtn)
        
        let increaseBtn = IncreaseThresholdButton(index: index)
        increaseBtn.frame = CGRect(x: Int(maxW) - 20 - buttonW, y: buttonY, width: buttonW, height: buttonH)
        increaseBtn.setBackgroundImage(#imageLiteral(resourceName: "MoreButton"), for: .normal)
        increaseBtn.addTarget(self, action: #selector(increaseThreshold), for: .touchUpInside)
        //edit
        temperatureChangeButtons.append(increaseBtn)
        self.scrollView.addSubview(increaseBtn)
        
        //Threshold Name Label
        let thresholdLabel = UILabel(frame: CGRect(x: 0, y: thresholdY + 8, width: thresholdW, height: 24))
        thresholdLabel.text = userData.thresholds[index].name
        thresholdLabel.textColor = .white
        thresholdLabel.textAlignment = .center
        thresholdLabel.font = thresholdLabel.font.withSize(24)
        //Make label tappable
        let tap = UITapGestureRecognizer(target: self, action: #selector(ThresholdsViewController.tapLabel(_:)))
        thresholdLabel.isUserInteractionEnabled = true
        thresholdLabel.addGestureRecognizer(tap)
        tap.name = thresholdLabel.text
        
        //edit
        thresholdLabel.tag = 100
        self.scrollView.addSubview(thresholdLabel)
        nameLabels.append(thresholdLabel)
        
        //Threshold Temperature Label
        let temperatureLabel = ThresholdLabel(ind: index)
        temperatureLabel.frame = CGRect(x: 0, y: thresholdY + 16 + 24, width: thresholdW, height: 48)
        temperatureLabel.text = "\(userData.thresholds[index].temperature)ºF"
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = thresholdLabel.font.withSize(48)
        
        //edit
        self.scrollView.addSubview(temperatureLabel)
        temperatureLabels.append(temperatureLabel)
    }
    
    func updateDefaultMessage() {
        //Empty Thresholds Label
        print("threshold.count = \(userData.thresholds.count)")
        if userData.thresholds.count > 0 {
            print("msg not hidden")
            emptyThresholdsLabel.isHidden = true
            emptyThresholdsLabel.alpha = 0
        } else {
            print("msg is hidden")
            emptyThresholdsLabel.isHidden = false
            emptyThresholdsLabel.alpha = 1
        }
    }
    
    func presentPopup(name: String) {
        var cei = -1
        for i in 0 ..< userData.thresholds.count {
            if userData.thresholds[i].name == name {
                cei = i
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ThresholdPopupVC") as! PopupViewController
        controller.modalTransitionStyle = .crossDissolve
        controller.userData.thresholds = userData.thresholds
        controller.previousVC = self
        controller.index = cei
        //userData.thresholds
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func tapLabel(_ sender: UITapGestureRecognizer) {
        print("tapped label \(sender.name ?? "n/a").")
        presentPopup(name: sender.name ?? "n/a")
    }
    
    @objc private func decreaseThreshold(sender: DecreaseThresholdButton) {
        print("Decreasing temperature for threshold \(sender.index).")
        userData.thresholds[sender.index].temperature -= 1
        temperatureLabels[sender.index].text = "\(userData.thresholds[sender.index].temperature)ºF"
        
    }
    
    @objc private func increaseThreshold(sender: IncreaseThresholdButton) {
        print("Increasing temperature for threshold \(sender.index).")
        userData.thresholds[sender.index].temperature += 1
        temperatureLabels[sender.index].text = "\(userData.thresholds[sender.index].temperature)ºF"
    }
    
    func fetchThresholds() {
        // Replace this with fetching the thresholds through firebase
        userData.thresholds.append(TemperatureThreshold(name: "Sweater", temperature: 70))
        userData.thresholds.append(TemperatureThreshold(name: "Jacket", temperature: 60))
        userData.thresholds.append(TemperatureThreshold(name: "Coat", temperature: 50))
        userData.thresholds.append(TemperatureThreshold(name: "Gloves", temperature: 40))
    }
    
    @objc func addNewThreshold() {
        userData.thresholds.insert(TemperatureThreshold(name: "New Threshold", temperature: 70), at: 0)
        scrollView.contentSize = CGSize(width: Int(view.frame.width), height: 120 * userData.thresholds.count)
        presentPopup(name: "New Threshold")
    }
    
    func clearThresholdsUI() {
        print("Removing views.")
        for element in nameLabels {
            element.tag = 100
            element.viewWithTag(100)?.removeFromSuperview()
        }
        for element in temperatureLabels {
            element.tag = 100
            element.viewWithTag(100)?.removeFromSuperview()
        }
        for element in thresholdViews {
            element.tag = 100
            element.viewWithTag(100)?.removeFromSuperview()
        }
        for element in temperatureChangeButtons {
            element.tag = 100
            element.viewWithTag(100)?.removeFromSuperview()
        }
        
        nameLabels = []
        temperatureLabels = []
        thresholdViews = []
        temperatureChangeButtons = []
    }
    
    func refreshThresholdsUI(count: Int) {
        for i in 0 ..< count {
            generateThresholdViewElement(index: i)
        }
        //Empty Thresholds Label
        print("threshold.count = \(count)")
        if count > 0 {
            print("msg not hidden")
            emptyThresholdsLabel.isHidden = true
            emptyThresholdsLabel.alpha = 0
        } else {
            print("msg is hidden")
            emptyThresholdsLabel.isHidden = false
            emptyThresholdsLabel.alpha = 1
        }
    }
    
    func removeThreshold(index: Int) {
        print("Removing new threshold.")
        scrollView.contentSize = CGSize(width: Int(view.frame.width), height: 120 * (userData.thresholds.count - 1))
        clearThresholdsUI()
        userData.thresholds.remove(at: index)
        refreshThresholdsUI(count: userData.thresholds.count)
    }
    
    @IBAction func addNewThresholdButtonPress(_ sender: Any) {
        print("Adding new threshold.")
        clearThresholdsUI()
        addNewThreshold()
        refreshThresholdsUI(count: userData.thresholds.count)
    }
    
    @IBAction func homeButtonPress(_ sender: UIButton) {
        proceedToHome()
    }
    
    
    func updateDatabase() {
        print("Updating database...")
    }
    
    func proceedToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
        nextVC?.userData = userData
        nextVC?.modalTransitionStyle = .crossDissolve
        updateDatabase()
        present(nextVC!, animated: true, completion: nil)
    }
}

private class DecreaseThresholdButton: UIButton {
    var index: Int
    init(index: Int) {
        self.index = index
        super.init(frame: CGRect())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class IncreaseThresholdButton: UIButton {
    var index: Int
    init(index: Int) {
        self.index = index
        super.init(frame: CGRect())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class ThresholdLabel: UILabel {
    var ind: Int
    init(ind: Int) {
        self.ind = ind
        super.init(frame: CGRect())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
