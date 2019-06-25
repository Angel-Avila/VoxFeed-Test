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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let views = getNavigator()?.segmentedControlViewControllers().map { $0.view! }
        
        guard let vcViews = views else { return }
        
        controllerView.setupViews(views: vcViews)
        
        _ = controllerView.topBar.segmentedControl.rx.controlEvent(.valueChanged).subscribe(onNext: { _ in
            
            let index = self.controllerView.topBar.segmentedControl.selectedSegmentIndex
            
            self.controllerView.indexSelected(index)
        })
    }
}
