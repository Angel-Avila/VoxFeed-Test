//
//  Navigator.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import Hero
import RxSwift

enum NavigationTarget {
    case root(view: NavigationView)
    case dismiss
    case push(view: NavigationView)
    case present(view: NavigationView)
    case presentOnNavigationController(view: NavigationView)
    case pop
    case popToRoot
}


protocol ComponentProvider {
    func resolve(_ view: NavigationView) -> UIViewController
}

class Navigator {
    
    var provider: ComponentProvider!
    var navigationController: UINavigationController!
    
    init(provider: ComponentProvider) {
        self.provider = provider
        setupNavigationController()
    }
    
    func getRoot() -> UIViewController {
        return navigationController
    }
    
    func navigate(_ target: NavigationTarget, _ source: UIViewController, animated: Bool = true) {
        switch target {
            
        case .dismiss:
            source.dismiss(animated: animated, completion: nil)
            
        case .pop:
            source.navigationController?.popViewController(animated: animated)
            
        case .popToRoot:
            source.navigationController?.popToRootViewController(animated: animated)
            
        case .push(let view):
            let vc = provider.resolve(view)
            source.navigationController?.pushViewController(vc, animated: animated)
            
        case .present(let view):
            let vc = provider.resolve(view)
            source.present(vc, animated: animated, completion: nil)
            
        case .presentOnNavigationController(let view):
            let vc = provider.resolve(view)
            let nc = UINavigationController(rootViewController: vc)
            
            source.present(nc, animated: animated, completion: nil)
            
        case .root(let view):
            let vc = provider.resolve(view)
            source.navigationController?.setViewControllers([vc], animated: animated)
        }
    }
    
    func setNavigationControllerRoot(_ view: NavigationView, animated: Bool = true) {
        navigationController.setViewControllers([provider.resolve(view)], animated: animated)
    }
    
    private func setupNavigationController() {
        navigationController = UINavigationController(rootViewController: provider.resolve(.home))
        navigationController.hero.isEnabled = true
        
        let view = UIView()
        view.backgroundColor = .black
        navigationController.view.addSubview(view)
        
        let height = UIApplication.shared.statusBarFrame.size.height
        
        view.pin.top()
            .horizontally()
            .height(height)
    }
}

extension UIViewController {
    func getNavigator() -> Navigator? {
        return (UIApplication.shared.delegate as? AppDelegate)?.navigator
    }
}

