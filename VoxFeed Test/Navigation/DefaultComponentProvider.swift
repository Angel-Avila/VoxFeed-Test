//
//  DefaultComponentProvider.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

enum NavigationView {
    case home
    case none
}

class DefaultComponentProvider: ComponentProvider {
    
    func resolve(_ view: NavigationView) -> UIViewController {
        switch view {
            
        case .home:
            return HomeViewController()
            
        default:
            return UIViewController(nibName: nil, bundle: nil)
        }
    }
}


