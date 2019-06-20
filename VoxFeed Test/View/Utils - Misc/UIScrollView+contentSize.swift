//
//  UIScrollView+contentSize.swift
//  Host
//
//  Created by Angel Avila on 2/25/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

extension UIScrollView {
    func setVerticalContentSize(lastView: UIView, offset: CGFloat = 30) {
        self.contentSize = CGSize(width: self.frame.width, height: lastView.frame.maxY + offset)
    }
}
