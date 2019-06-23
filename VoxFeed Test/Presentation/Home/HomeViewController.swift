//
//  HomeViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import RxCocoa
class HomeViewController: ViewController<HomeView> {
    
    init() {
        super.init(belowStatusBar: true)
        controllerView = HomeView()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .red
        let views = [LandingViewController(), vc].map { $0.view! }
        
        controllerView.setupViews(views: views)
        
        _ = controllerView.topBar.segmentedControl.rx.controlEvent(.valueChanged).subscribe(onNext: { _ in
            
            let index = self.controllerView.topBar.segmentedControl.selectedSegmentIndex
            
            self.controllerView.indexSelected(index)
        })
    }
}
