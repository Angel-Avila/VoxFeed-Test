//
//  HomeViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class HomeViewController: ViewController<HomeView> {
    
    init() {
        super.init(showsNavBar: true, title: "VoxFeed")
        controllerView = HomeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
