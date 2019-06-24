//
//  FeedViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class FeedViewController: ViewController<FeedView> {
    
    let presenter: FeedPresenter!
    
    init(withPresenter presenter: FeedPresenter) {
        self.presenter = presenter
        
        super.init()
        controllerView = FeedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handlePresenterStates()
        
        presenter.fetchPosts()
    }
    
    private func handlePresenterStates() {
        _ = presenter.feedStateObservable.subscribe(onNext: { state in
    
            switch state {
            case .fetching:
                break
            case .fetched(let postViewModels):
                postViewModels.forEach { print($0.campaignName, $0.date) }
            case .errorDownloading:
                break
            }
            
        })
    }
}
