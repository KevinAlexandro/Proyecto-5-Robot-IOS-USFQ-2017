//
//  ParteRobot.swift
//  Robot
//
//  Created by user130165 on 11/19/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

@IBDesignable

class ParteRobot: UIButton {
    
    @IBInspectable var filColor : UIColor = UIColor.blue
    @IBInspectable var cornerRadio : CGFloat = 0

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.cornerRadius = cornerRadio
        layer.backgroundColor = filColor.cgColor
    }

}
