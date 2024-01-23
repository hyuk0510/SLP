//
//  SLPButton.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/12.
//

import UIKit

final class SLPButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.configuration?.titlePadding = 20
        self.titleLabel?.font = Typography.title2
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
