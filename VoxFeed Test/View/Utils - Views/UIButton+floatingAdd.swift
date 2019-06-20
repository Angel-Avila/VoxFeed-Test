//
//  UIButton+floatingAdd.swift
//  Host
//
//  Created by Angel Avila on 4/29/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

extension UIButton {
    static func floating(image: UIImage, color: UIColor = .white, tintColor: UIColor = .white, size: CGFloat = 60) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = color
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
        button.imageView?.contentMode = .scaleAspectFit
        button.giveStandardShadow()
        button.pin.size(CGSize(width: size, height: size))
        button.layer.cornerRadius = size/2
        return button
    }
    
    static func floatingAdd(color: UIColor = .white, tintColor: UIColor = .white) -> UIButton {
        return UIButton.floating(image: #imageLiteral(resourceName: "iconAdd"), color: color, tintColor: tintColor)
    }
}
