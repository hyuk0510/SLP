//
//  ViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/02.
//

import UIKit
import SnapKit

final class onBoardingViewController: BaseViewController {

    let label = {
        let view = UILabel()
        view.text = "새싹톡을 사용하면 어디서나\n팀을 모을 수 있습니다"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.font = Typography.title1
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.image = UIImage(named: "onboarding")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var startButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "startButton_active"), for: .normal)
        view.addTarget(self, action: #selector(startButtonPresssed), for: .touchUpInside)
        return view
    }()
    
    @objc
    private func startButtonPresssed() {
        let vc = AuthViewController()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

    override func configure() {
        
        view.backgroundColor = Background.primary
        
        [label, imageView, startButton].forEach { subView in
            view.addSubview(subView)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(93)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(45)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}

