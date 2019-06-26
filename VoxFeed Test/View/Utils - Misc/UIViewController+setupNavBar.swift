//
//  UIViewController+setupNavBar.swift
//  Host
//
//  Created by Angel Avila on 2/19/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit
import PinLayout

extension UIViewController {
    func setupNavBar(title: String) {
        self.title = title
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func topBarHeight() -> CGFloat {
        let navBarHeight = self.navigationController?.navigationBar.frame.height ?? 0.0
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height + navBarHeight
        return topBarHeight
    }
    
    func pinControllerViewToTopBar(_ controllerView: UIView) {
        let topBarHeight = self.topBarHeight()
        
        view.addSubview(controllerView)
        controllerView.pin.top(view.pin.safeArea + topBarHeight)
            .bottom()
            .horizontally()
    }
}
