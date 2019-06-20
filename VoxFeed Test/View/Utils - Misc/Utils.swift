//
//  Utils.swift
//  Topico
//
//  Created by Angel Avila on 6/11/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class Utils {
    private init() {}
    
    static func phoneHasNotch() -> Bool {
        let h = UIScreen.main.nativeBounds.height
        
        if h == 2436 || h == 2688 || h == 1792 {
            return true
        }
        
        return false
    }
    
    static func iPhoneX() -> Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    
    static func iPhoneXs() -> Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    
    static func iPhoneXsMax() -> Bool {
        return UIScreen.main.nativeBounds.height == 2688
    }
    
    static func iPhoneXr() -> Bool {
        return UIScreen.main.nativeBounds.height == 1792
    }
}
