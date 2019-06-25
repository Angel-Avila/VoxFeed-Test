//
//  LandingView.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import PinLayout

class LandingView: ControllerView {

    lazy var welcomeLabel = UILabel.withFont(font: .regular, size: 32, text: "Bienvenido a\nVoxFeed", textColor: .charcoal, textAlignment: .center)
    
    lazy var groundImageView = ImageView(image: #imageLiteral(resourceName: "ground-shape"), contentMode: .scaleAspectFill)
    
    lazy var audienceImageView = ImageView(image: #imageLiteral(resourceName: "icon-awesome-faces"))
    
    override func addSubviews() {
        addSubview(welcomeLabel)
        addSubview(groundImageView)
        addSubview(audienceImageView)
    }
    
    override func setupUI() {
        welcomeLabel.pin.top(10%)
            .horizontally()
            .height(100)
        
        groundImageView.pin.bottom()
            .horizontally()
            .height(42%)
        
        audienceImageView.pin.vCenter(to: groundImageView.edge.top)
            .hCenter()
            .width(60%)
            .height(25%)
    }
    
}
