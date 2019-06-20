//
//  UIView+standarShadow.swift
//  Host
//
//  Created by Angel Avila on 2/13/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

extension UIView {
    static func standardShadowView() -> UIView {
        let view = UIView(frame: .zero)
        view.giveStandardShadow()
        view.backgroundColor = .white
        return view
    }
    
    func giveStandardShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 12
    }
    
    func giveMinorShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 6
    }
}
