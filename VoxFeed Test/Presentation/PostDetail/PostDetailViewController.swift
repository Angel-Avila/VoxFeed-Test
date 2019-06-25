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
    
    let statusBarView = UIView()
    
    init(withPost post: PostViewModel) {
        self.post = post
        
        super.init(showsNavBar: true, title: "", belowStatusBar: false)
        controllerView = PostDetailView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusBarView.backgroundColor = .black
        navigationController?.navigationBar.addSubview(statusBarView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let height = UIApplication.shared.statusBarFrame.size.height
        
        statusBarView.pin.top(-height)
            .horizontally()
            .height(height)
    }
}
