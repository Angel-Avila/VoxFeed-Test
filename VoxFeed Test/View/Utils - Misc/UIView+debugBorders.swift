//
//  UIView+debugBorders.swift
//  Topico
//
//  Created by Angel Avila on 6/11/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

extension UIView {
    func enableDebugBorders(color: UIColor = .black) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
}
