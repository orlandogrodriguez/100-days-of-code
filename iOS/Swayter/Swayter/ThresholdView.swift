//
//  ThresholdView.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/19/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit

class ThresholdView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var name: String = "New Threshold"
    var threshold: Int = 70
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit(name: String, threshold: Int) {
        self.name = name
        self.threshold = threshold
    }
    
    private func commonInit() {
        self.commonInit(name: "New Threshold", threshold: 70)
    }

}
