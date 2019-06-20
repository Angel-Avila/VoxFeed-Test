//
//  ImageView.swift
//  Host
//
//  Created by Angel Avila on 2/19/19.
//  Copyright © 2019 Regiztra. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFit) {
        super.init(image: image)
        self.contentMode = contentMode
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
