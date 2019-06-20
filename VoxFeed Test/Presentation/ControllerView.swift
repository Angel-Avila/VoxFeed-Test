//
//  ControllerView.swift
//  Topico
//
//  Created by Angel Avila on 5/14/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

protocol View: UIView {
    func setupUI()
}

class ControllerView: UIView, View {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }
}
