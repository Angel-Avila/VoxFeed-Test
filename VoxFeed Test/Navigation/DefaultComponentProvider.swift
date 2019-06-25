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
    case landing
    case feed
    case none
}

class DefaultComponentProvider: ComponentProvider {
    
    private let postProvider = PostServices()
    
    func resolve(_ view: NavigationView) -> UIViewController {
        switch view {
            
        case .home:
            return HomeViewController()
            
        case .landing:
            return LandingViewController()
            
        case .feed:
            let feedPresenter = FeedPresenterImpl(withProvider: postProvider)
            return FeedViewController(withPresenter: feedPresenter)
            
        default:
            return UIViewController(nibName: nil, bundle: nil)
        }
    }
    
    func segmentedControlViewControllers() -> [UIViewController] {
        return [resolve(.landing), resolve(.feed)]
    }
}


