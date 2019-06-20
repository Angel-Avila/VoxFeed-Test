//
//  UILabel+font.swift
//  Host
//
//  Created by Angel Avila on 2/15/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

extension UILabel {
    static func withFont(font: UIFont, size: CGFloat? = nil, text: String? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment = .center) -> UILabel {
        
        let label = UILabel(frame: .zero)
        label.text = text
        
        if let size = size {
            label.font = font.withSize(size)
        } else {
            label.font = font
        }
        
        if let textColor = textColor {
            label.textColor = textColor
        }
        
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        
        return label
    }
}
