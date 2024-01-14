//
//  SplashViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/02.
//

import UIKit
import RxSwift
import RxCocoa

final class SplashViewController: BaseViewController {
    
    private let label = UILabel()
    private let imageView = UIImageView()
    
    private let disposeBag = DisposeBag()
    
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
    
    override func bind() {
        
        let title = BehaviorRelay(value: "새싹톡을 사용하면 어디서나\n팀을 모을 수 있습니다")
        let image = BehaviorRelay(value: UIImage(named: "onboarding"))
        
        title
            .subscribe(with: label) { owner, string in
                owner.text = string
                owner.font = Typography.title1
                owner.numberOfLines = 2
                owner.textAlignment = .center
            }
            .disposed(by: DisposeBag())
        
        image
            .subscribe(with: imageView, onNext: { owner, image in
                owner.image = image
                owner.contentMode = .scaleAspectFit
            })
            .disposed(by: disposeBag)
    }
    
    override func configure() {
                
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
