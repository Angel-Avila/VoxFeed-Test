//
//  UIButton+large.swift
//  Host
//
//  Created by Angel Avila on 2/15/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit
import PinLayout

extension UIButton {
    static func largeButton(title: String?, backgroundColor: UIColor, titleColor: UIColor, height: CGFloat = 60) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.demiBold.withSize(18)
        button.giveStandardShadow()
        button.pin.height(height)
        button.layer.cornerRadius = height/2
        return button
    }
}

