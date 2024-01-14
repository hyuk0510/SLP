//
//  SignUpTextField.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/11.
//

import UIKit

final class SignUpTextField: UITextField {
    
    var str: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(str: String) {
        self.init()
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: self.frame.height))
        
        self.backgroundColor = Brand.white
        self.placeholder = str
        self.layer.cornerRadius = 8
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
        self.attributedPlaceholder = NSAttributedString(string: str, attributes: [.font: Typography.body])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpTextField: UITextFieldDelegate {
    
}
