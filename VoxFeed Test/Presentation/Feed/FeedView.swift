//
//  FeedView.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class FeedView: ControllerView {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setupUI() {
        collectionView.backgroundColor = .white
        addSubview(collectionView)
        collectionView.pin.all()
    }
    
}
