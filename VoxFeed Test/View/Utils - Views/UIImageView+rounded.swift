//
//  UIImageView+rounded.swift
//  Host
//
//  Created by Angel Avila on 2/12/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit
import PinLayout

extension UIImageView {
    
    static func rounded(height: CGFloat, image: UIImage? = nil, contentMode: ContentMode = .scaleAspectFill) -> UIImageView {
        let iv = UIImageView(image: image)
        iv.contentMode = contentMode
        iv.pin.height(height).width(height)
        iv.layer.cornerRadius = height/2
        iv.clipsToBounds = true
        return iv
    }
    
}
