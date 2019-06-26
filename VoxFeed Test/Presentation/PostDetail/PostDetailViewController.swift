//
//  PostDetailViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/25/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class PostDetailViewController: ViewController<PostDetailView> {
    
    let post: PostViewModel!
    
    lazy var statusBarView = UIView()
    lazy var usernameLabel = UILabel.withFont(font: .demiBold, size: 16, text: nil, textColor: .textColor, textAlignment: .center)
    lazy var dateLabel = UILabel.withFont(font: .regular, size: 10, text: nil, textColor: .textColor, textAlignment: .center)
    
    init(withPost post: PostViewModel) {
        self.post = post
        
        super.init(showsNavBar: true, title: "", belowStatusBar: false)
        controllerView = PostDetailView()
        controllerView.configureFrom(post)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        statusBarView.removeFromSuperview()
        usernameLabel.removeFromSuperview()
        dateLabel.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutNavigationBarViews()
    }
    
    private func setupNavigationBar() {
        statusBarView.backgroundColor = .black
        navigationController?.navigationBar.addSubview(statusBarView)
        navigationController?.navigationBar.addSubview(usernameLabel)
        navigationController?.navigationBar.addSubview(dateLabel)
        
        usernameLabel.text = post.username
        dateLabel.text = post.date
    }
    
    private func layoutNavigationBarViews() {
        let height = UIApplication.shared.statusBarFrame.size.height
        let vInset: CGFloat = 6
        
        statusBarView.pin.top(-height)
            .horizontally()
            .height(height)
        
        usernameLabel.pin.top(vInset)
            .horizontally()
            .height(17)
        
        dateLabel.pin.bottom(vInset)
            .horizontally()
            .height(11)
    }
}
