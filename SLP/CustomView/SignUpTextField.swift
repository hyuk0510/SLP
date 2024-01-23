//
//  SignUpTextField.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/11.
//

import UIKit

final class SignUpTextField: UITextField {
        
    init(placeholdertext: String) {
        super.init(frame: .zero)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: self.frame.height))
        
        self.backgroundColor = Brand.white
        self.placeholder = placeholdertext
        self.layer.cornerRadius = 8
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
        self.attributedPlaceholder = NSAttributedString(string: placeholdertext, attributes: [.font: Typography.body])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
