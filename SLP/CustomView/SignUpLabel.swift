//
//  SignUpLabel.swift
//  SLP
//
//  Created by 선상혁 on 1/18/24.
//

import UIKit

final class SignUpLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = Typography.title2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
