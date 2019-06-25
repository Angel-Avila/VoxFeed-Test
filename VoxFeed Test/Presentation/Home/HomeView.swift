//
//  HomeView.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class HomeView: ControllerView {
    
    lazy var topBar = HomeTopBar()
    
    private var vcViews = [UIView]()
    
    private var lastShown = 0
    
    override func addSubviews() {
        addSubview(topBar)
    }
    
    override func setupUI() {
        topBar.pin.top()
            .horizontally()
    }
    
    func setupViews(views: [UIView]) {
        vcViews = views
        
        let offset = topBar.height
        
        views.forEach { view in
            
            addSubview(view)
            view.pin.top(offset)
                .horizontally()
                .bottom()
            
            view.isHidden = true
        }
        
        views.first?.isHidden = false
    }
    
    func indexSelected(_ index: Int) {
        vcViews[lastShown].isHidden = true
        vcViews[index].isHidden = false
        
        lastShown = index
    }
}
