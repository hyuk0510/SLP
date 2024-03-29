//
//  BaseViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/02.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Background.primary
        configure()
        bind()
    }
    
    func configure() {}
    
    func bind() {}
}
