//
//  PostCell.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/24/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import AlamofireImage

class GenericCollectionViewCell<U>: UICollectionViewCell {
    var item: U!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class PostCell: GenericCollectionViewCell<PostViewModel> {
    
    lazy var userPhoto = UIImageView.rounded(height: 36)
    
    lazy var usernameLabel = UILabel.withFont(font: .demiBold, size: 17, text: nil, textColor: .textColor, textAlignment: .left)
    lazy var socialNetworkLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .textColor, textAlignment: .left)
    lazy var dateLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .voxFeedBlue, textAlignment: .right)
    
    lazy var detailLabel = UILabel.withFont(font: .regular, size: 15, text: nil, textColor: .valueTextColor, textAlignment: .left)
    
    lazy var postImage = ImageView(image: nil, contentMode: .scaleAspectFit)
    
    lazy var divider: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.65, alpha: 1)
        return view
    }()
    
    let downloader = ImageDownloader()
    
    override var item: PostViewModel? {
        didSet {
            guard let post = item else { return }
            userPhoto.af_setImage(withURL: post.profileImageURL)
            usernameLabel.text = post.username
            socialNetworkLabel.text = post.socialNetwork
            socialNetworkLabel.textColor = post.socialNetworkColor
            dateLabel.text = post.date
            detailLabel.text = post.postText
//            downloadPostImage(post, completion: nil)
        }
    }
    
    func downloadPostImage(_ post: PostViewModel, completion: (() -> Void)?) {
        let urlRequest = URLRequest(url: post.postImageURL)

        downloader.download(urlRequest) { response in
            if let image = response.result.value {
                self.postImage.image = image
            }
            
            self.setNeedsLayout()
            
            completion?()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func addSubviews() {
        contentView.addSubview(userPhoto)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(socialNetworkLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(divider)
    }
    
    private func setupViews() {
        let hMargin: CGFloat = 20
        let topMargin: CGFloat = 10
        
        userPhoto.pin.left(hMargin)
            .top(topMargin)
        
        usernameLabel.pin.after(of: userPhoto)
            .top(to: userPhoto.edge.top)
            .width(400)
            .height(16)
            .marginLeft(4)
        
        socialNetworkLabel.pin.left(to: usernameLabel.edge.left)
            .top(to: userPhoto.edge.vCenter)
            .width(400)
            .height(16)
            .marginTop(4)
        
        dateLabel.pin.top(to: userPhoto.edge.top)
            .right(hMargin)
            .width(100)
            .height(16)
        
        detailLabel.pin.below(of: userPhoto)
            .horizontally(hMargin)
            .height(55)
            .marginTop(30)
        
        if postImage.image == nil {
            postImage.pin.below(of: detailLabel)
                .horizontally(hMargin)
                .height(250)
                .marginTop(12)
        } else {
            postImage.pin.below(of: detailLabel)
                .horizontally(hMargin)
                .aspectRatio()
                .marginTop(12)
        }

        divider.pin.below(of: postImage)
            .left(hMargin)
            .right()
            .height(0.5)
            .marginTop(20)
        
        contentView.pin.height(divider.frame.maxY)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        setupViews()
        return contentView.frame.size
    }
}
