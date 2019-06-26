//
//  StatsView.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/26/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class StatsView: UIView {
    
    static let height: CGFloat = 48
    
    lazy var icon = ImageView(image: #imageLiteral(resourceName: "icon-likes"))
    lazy var descriptionLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .textColor, textAlignment: .left)
    lazy var countLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .valueTextColor, textAlignment: .right)
    
    lazy var divider = UIView.withBackgroundColor(color: .lightGray)
    
    init(text: String, image: UIImage) {
        super.init(frame: .zero)

        icon.image = image
        descriptionLabel.text = text
        countLabel.text = "123,403"
        
        addViews()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupFrames()
    }
    
    private func addViews() {
        addSubview(icon)
        addSubview(descriptionLabel)
        addSubview(countLabel)
        addSubview(divider)
    }
    
    private func setupFrames() {
        pin.width(UIScreen.main.bounds.width)
            .height(StatsView.height)
        
        let hMargin: CGFloat = 20
        let iconSize: CGFloat = 18
        
        icon.pin.left(hMargin)
            .vCenter()
            .width(iconSize)
            .height(iconSize)
        
        descriptionLabel.pin.after(of: icon)
            .vCenter()
            .right(to: edge.hCenter)
            .height(16)
            .marginLeft(hMargin)
        
        countLabel.pin.right(6)
            .vCenter()
            .left(to: edge.hCenter)
            .height(16)
        
        divider.pin.bottom()
            .after(of: icon)
            .right()
            .height(0.5)
            .marginLeft(hMargin)
    }
}
