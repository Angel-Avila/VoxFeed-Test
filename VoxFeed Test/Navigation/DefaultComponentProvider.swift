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
    case detail(post: PostViewModel)
    case none
}

class DefaultComponentProvider: ComponentProvider {
    
    private let postProvider = PostServices()
    
    let rootViewController = HomeViewController()
    
    func resolve(_ view: NavigationView) -> UIViewController {
        switch view {
            
        case .home:
            return rootViewController
            
        case .landing:
            return LandingViewController()
            
        case .feed:
            let feedPresenter = FeedPresenterImpl(withProvider: postProvider)
            return FeedViewController(withPresenter: feedPresenter, presentingViewController: rootViewController)
            
        case .detail(let post):
            return PostDetailViewController(withPost: post)
            
        default:
            return UIViewController(nibName: nil, bundle: nil)
        }
    }
    
    func segmentedControlViewControllers() -> [UIViewController] {
        return [resolve(.landing), resolve(.feed)]
    }
}


