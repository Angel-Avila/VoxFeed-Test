//
//  LandingViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class LandingViewController: ViewController<LandingView> {
    
    init() {
        super.init()
        controllerView = LandingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateAppearance()
    }
    
    private func animateAppearance() {
        let faces = controllerView.audienceImageView
        let label = controllerView.welcomeLabel
        
        faces.transform = CGAffineTransform(translationX: 0, y: -50)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn], animations: {
            faces.transform = .identity
            faces.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.66, animations: {
                label.alpha = 1
            })
        }
        

    }
}
