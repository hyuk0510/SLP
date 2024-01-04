//
//  SplashViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/02.
//

import UIKit

final class SplashViewController: BaseViewController {
    
    let label = {
        let view = UILabel()
        view.text = "새싹톡을 사용하면 어디서나\n팀을 모을 수 있습니다"
        view.numberOfLines = 2
        view.font = Typography.title1
        view.textAlignment = .center
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.image = UIImage(named: "onboarding")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            //분기처리
            let vc = onBoardingViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        
        view.backgroundColor = Background.primary
        
        [label, imageView].forEach { subView in
            view.addSubview(subView)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(93)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
}
