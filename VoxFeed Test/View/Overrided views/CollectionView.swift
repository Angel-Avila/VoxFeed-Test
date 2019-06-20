//
//  CollectionView.swift
//  Topico
//
//  Created by Angel Avila on 6/9/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
