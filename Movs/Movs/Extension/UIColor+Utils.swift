//
//  UIColor+Utils.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(Double(r) / 255.0),
                  green: CGFloat(Double(g) / 255.0),
                  blue: CGFloat(Double(b) / 255.0),
                  alpha: 1)
    }
}

extension UIColor {
    @nonobjc class var movsYellow: UIColor {
        return UIColor(r: 247, g: 206, b: 91)
    }

    @nonobjc class var movsDarkPurple: UIColor {
        return UIColor(r: 45, g: 48, b: 71)
    }

    @nonobjc class var movsLightGray: UIColor {
        return UIColor(r: 216, g: 216, b: 216)
    }
}
