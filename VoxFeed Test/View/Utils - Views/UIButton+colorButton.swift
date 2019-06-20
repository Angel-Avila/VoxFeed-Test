//
//  UIButton+colorButton.swift
//  Topico
//
//  Created by Angel Avila on 6/11/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

extension UIButton {
    static func colorButton(color: UIColor, size: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = color
        
        button.layer.cornerRadius = size/2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        
        button.frame = CGRect(x: 0, y: 0, width: size, height: size)
        
        return button
    }
}
