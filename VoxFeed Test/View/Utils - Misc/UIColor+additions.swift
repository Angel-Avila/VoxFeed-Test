//
//  UIColor+additions.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

extension UIColor {
    
    @nonobjc class var voxFeedBlue: UIColor {
        return UIColor(hex: "00D7E9")
    }
    
    @nonobjc class var facebookColor: UIColor {
        return UIColor(hex: "45609C")
    }
    
    @nonobjc class var twitterColor: UIColor {
        return UIColor(hex: "1DA1F2")
    }
    
    @nonobjc class var instagramColor: UIColor {
        return UIColor(hex: "E4405F")
    }
    
    @nonobjc class var textColor: UIColor {
        return UIColor(hex: "030303")
    }
    
    @nonobjc class var valueTextColor: UIColor {
        return UIColor(hex: "8F8E94")
    }
    
    @nonobjc class var mediumGrey: UIColor {
        return UIColor(red: 103.0 / 255.0, green: 108.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greyBlue: UIColor {
        return UIColor(red: 107.0 / 255.0, green: 124.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var halfGrey: UIColor {
        return UIColor(white: 155.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var dark: UIColor {
        return UIColor(red: 40.0 / 255.0, green: 44.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var charcoal: UIColor {
        return UIColor(red: 59.0 / 255.0, green: 63.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkMint: UIColor {
        return UIColor(red: 68.0 / 255.0, green: 201.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightGrey: UIColor {
        return UIColor(white: 230.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var midBlue: UIColor {
        return UIColor(red: 25.0 / 255.0, green: 94.0 / 255.0, blue: 170.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightBlueGrey: UIColor {
        return UIColor(red: 212.0 / 255.0, green: 212.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
    }
}


extension UIColor {
    // init uicolor from hex
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    public func hexDescription(_ includeAlpha: Bool = false) -> String {
        guard self.cgColor.numberOfComponents == 4 else {
            return "Color not RGB."
        }
        let a = self.cgColor.components!.map { Int($0 * CGFloat(255)) }
        let color = String.init(format: "%02x%02x%02x", a[0], a[1], a[2])
        if includeAlpha {
            let alpha = String.init(format: "%02x", a[3])
            return "\(color)\(alpha)"
        }
        return color.uppercased()
    }
}
