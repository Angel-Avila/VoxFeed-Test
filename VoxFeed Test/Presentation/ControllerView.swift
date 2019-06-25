//
//  ControllerView.swift
//  Topico
//
//  Created by Angel Avila on 5/14/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

protocol View: UIView {
    func addSubviews()
    func setupUI()
}

class ControllerView: UIView, View {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func addSubviews() {
        
    }
    
    func setupUI() {
        
    }
}
