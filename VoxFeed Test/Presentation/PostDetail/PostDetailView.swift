//
//  PostDetailView.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/25/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import PinLayout

class PostDetailView: ControllerView {
    
    lazy var coverImageView = ImageView(image: nil, contentMode: .scaleAspectFill)
    lazy var brandImageView = UIImageView.rounded(height: 48)
    
    lazy var brandNameLabel = UILabel.withFont(font: .regular, size: 17, text: nil, textColor: .white, textAlignment: .left)
    lazy var campaignNameLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .white, textAlignment: .left)
    
    lazy var earningsLabel = UILabel.withFont(font: .regular, size: 17, text: nil, textColor: .voxFeedBlue, textAlignment: .right)
    
    lazy var bottomContainer = UIView.withBackgroundColor(color: UIColor(white: 0.95, alpha: 1))
    
    lazy var performanceLabel = UILabel.withFont(font: .regular, size: 13, text: "DESEMPEÑO", textColor: .valueTextColor, textAlignment: .left)
    
    var likesStat = StatsView(text: "Me gusta", image: #imageLiteral(resourceName: "icon-likes"))
    var commentsStat = StatsView(text: "Comentarios", image: #imageLiteral(resourceName: "icon-comments"))
    var sharesStat = StatsView(text: "Compartido", image: #imageLiteral(resourceName: "icon-share"))
    var audienceStat = StatsView(text: "Audiencia", image: #imageLiteral(resourceName: "icon-audience"))
    var clicksStat = StatsView(text: "Clics", image: #imageLiteral(resourceName: "icon-clicks"))
    
    var statsStackView: UIStackView!
    
    lazy var socialNetworkButton: UIButton! = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.demiBold.withSize(17)
        button.pin.height(46)
        return button
    }()
    
    override init() {
        statsStackView = UIStackView(arrangedSubviews: [likesStat,
                                                        commentsStat,
                                                        sharesStat,
                                                        audienceStat,
                                                        clicksStat])
        
        statsStackView.alignment = .top
        statsStackView.axis = .vertical
        statsStackView.distribution = .fillEqually
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        addSubview(coverImageView)
        addSubview(brandImageView)
        addSubview(brandNameLabel)
        addSubview(campaignNameLabel)
        addSubview(earningsLabel)
        addSubview(bottomContainer)
        bottomContainer.addSubview(performanceLabel)
        bottomContainer.addSubview(statsStackView)
        bottomContainer.addSubview(socialNetworkButton)
    }
    
    override func setupUI() {
        let hMargin: CGFloat = 20
        let vMargin: CGFloat = 30
        
        coverImageView.pin.top()
            .horizontally()
            .height(36%)
        
        brandImageView.pin.bottom(to: coverImageView.edge.bottom)
            .left(hMargin)
            .marginBottom(vMargin)
        
        brandNameLabel.pin.top(to: brandImageView.edge.top)
            .right(of: brandImageView)
            .right(to: edge.hCenter)
            .height(18)
            .marginLeft(6)
        
        campaignNameLabel.pin.top(to: brandImageView.edge.vCenter)
            .right(of: brandImageView)
            .right(to: edge.hCenter)
            .height(16)
            .marginLeft(6)
        
        earningsLabel.pin.top(to: brandImageView.edge.vCenter)
            .right(hMargin)
            .left(to: edge.hCenter)
            .height(16)
            .marginLeft(4)
        
        bottomContainer.pin.below(of: coverImageView)
            .horizontally()
            .bottom()
        
        performanceLabel.pin.top(30)
            .horizontally(hMargin)
            .height(14)
        
        let stackViewHeight = CGFloat(statsStackView.arrangedSubviews.count) * StatsView.height
        
        statsStackView.pin.below(of: performanceLabel)
            .horizontally()
            .height(stackViewHeight)
            .marginTop(6)
        
        socialNetworkButton.pin.bottom()
            .horizontally()
    }
    
    func configureFrom(_ post: PostViewModel) {
        coverImageView.af_setImage(withURL: post.campaignImageURL)
        brandImageView.af_setImage(withURL: post.brandImageURL)
        
        brandNameLabel.text = post.brandName
        campaignNameLabel.text = post.campaignName
        
        earningsLabel.text = post.earnings
        
        likesStat.countLabel.text = post.likes
        commentsStat.countLabel.text = post.comments
        sharesStat.countLabel.text = post.shares
        audienceStat.countLabel.text = post.audience
        clicksStat.countLabel.text = post.clicks
        
        socialNetworkButton.setTitle("Ver publicación en \(post.socialNetwork)", for: .normal)
        socialNetworkButton.backgroundColor = post.socialNetworkColor
    }
    
}
