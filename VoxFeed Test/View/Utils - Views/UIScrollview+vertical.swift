//
//  UIScrollview+vertical.swift
//  Host
//
//  Created by Angel Avila on 2/18/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

extension UIScrollView {
    static func vertical() -> UIScrollView {
        let sv = UIScrollView(frame: .zero)
        sv.bounces = true
        sv.isPagingEnabled = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }
}
