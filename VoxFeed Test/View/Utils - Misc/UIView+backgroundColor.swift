//
//  UIView+backgroundColor.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/26/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

extension UIView {
    static func withBackgroundColor(color: UIColor) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = color
        return view
    }
}
