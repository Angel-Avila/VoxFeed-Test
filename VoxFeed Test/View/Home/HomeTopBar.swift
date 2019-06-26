//
//  HomeTopBar.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class HomeTopBar: UIView {
    
    lazy var titleLabel = UILabel.withFont(font: .bold, size: 17, text: "VoxFeed", textColor: .textColor, textAlignment: .center)
    
    lazy var segmentedControl = UISegmentedControl(items: ["Inicio", "Publicaciones"])
    
    lazy var divider = UIView()
    
    let height: CGFloat = 82
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        addViews()
        backgroundColor = UIColor(white: 0.99, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupFrames()
    }
    
    private func setupViews() {
        segmentedControl.tintColor = .voxFeedBlue
        segmentedControl.selectedSegmentIndex = 0
        divider.backgroundColor = .lightGray
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(segmentedControl)
        addSubview(divider)
    }
    
    private func setupFrames() {
        pin.width(UIScreen.main.bounds.width)
            .height(height)
        
        titleLabel.pin.top(10)
            .horizontally()
            .height(20)
        
        segmentedControl.pin.below(of: titleLabel)
            .horizontally(10)
            .marginTop(10)
        
        divider.pin.bottom()
            .horizontally()
            .height(0.5)
    }
    
}
