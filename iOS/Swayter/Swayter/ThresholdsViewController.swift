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
    var thresholds: [TemperatureThreshold] = []
    var nameLabels: [UILabel] = []
    var temperatureLabels: [UILabel] = []
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchThresholds()
        let svHeight = Int((view.frame.height - 104) - (titleLabel.frame.maxY + 44))
        scrollView.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 44, width: view.frame.width, height: CGFloat(svHeight))
        scrollView.contentSize = CGSize(width: Int(view.frame.width), height: 120 * thresholds.count)
        
        print("120 * thresholds.count = \(120 * thresholds.count)")
        
        view.addSubview(scrollView)
        
        
        
        for i in 0 ..< thresholds.count {
            generateThresholdViewElement(index: i)
        }
        
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
        
        //edit
        self.scrollView.addSubview(thresholdView)
        
        
        // Threshold Buttons
        let decreaseBtn = DecreaseThresholdButton(index: index)
        decreaseBtn.frame = CGRect(x: 20, y: buttonY, width: buttonW, height: buttonH)
        decreaseBtn.setBackgroundImage(#imageLiteral(resourceName: "LessButton"), for: .normal)
        decreaseBtn.addTarget(self, action: #selector(decreaseThreshold), for: .touchUpInside)
        //edit
        self.scrollView.addSubview(decreaseBtn)
        
        let increaseBtn = IncreaseThresholdButton(index: index)
        increaseBtn.frame = CGRect(x: Int(maxW) - 20 - buttonW, y: buttonY, width: buttonW, height: buttonH)
        increaseBtn.setBackgroundImage(#imageLiteral(resourceName: "MoreButton"), for: .normal)
        increaseBtn.addTarget(self, action: #selector(increaseThreshold), for: .touchUpInside)
        //edit
        self.scrollView.addSubview(increaseBtn)
        
        //Threshold Name Label
        let thresholdLabel = UILabel(frame: CGRect(x: 0, y: thresholdY + 8, width: thresholdW, height: 24))
        thresholdLabel.text = thresholds[index].name
        thresholdLabel.textColor = .white
        thresholdLabel.textAlignment = .center
        thresholdLabel.font = thresholdLabel.font.withSize(24)
        
        //edit
        self.scrollView.addSubview(thresholdLabel)
        nameLabels.append(thresholdLabel)
        
        //Threshold Temperature Label
        let temperatureLabel = UILabel(frame: CGRect(x: 0, y: thresholdY + 16 + 24, width: thresholdW, height: 48))
        temperatureLabel.text = "\(thresholds[index].temperature)ºF"
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = thresholdLabel.font.withSize(48)
        
        //edit
        self.scrollView.addSubview(temperatureLabel)
        temperatureLabels.append(temperatureLabel)
    
    }
    
    @objc private func decreaseThreshold(sender: DecreaseThresholdButton) {
        print("Decreasing temperature for threshold \(sender.index).")
        thresholds[sender.index].temperature -= 1
        temperatureLabels[sender.index].text = "\(thresholds[sender.index].temperature)ºF"
        
    }
    
    @objc private func increaseThreshold(sender: IncreaseThresholdButton) {
        print("Increasing temperature for threshold \(sender.index).")
        thresholds[sender.index].temperature += 1
        temperatureLabels[sender.index].text = "\(thresholds[sender.index].temperature)ºF"
    }
    
    func fetchThresholds() {
        // Replace this with fetching the thresholds through firebase
        thresholds.append(TemperatureThreshold(name: "Sweater", temperature: 70))
        thresholds.append(TemperatureThreshold(name: "Jacket", temperature: 60))
        thresholds.append(TemperatureThreshold(name: "Coat", temperature: 50))
        thresholds.append(TemperatureThreshold(name: "Gloves", temperature: 40))
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

