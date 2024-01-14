//
//  ViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class onBoardingViewController: BaseViewController {

    private let label = UILabel()
    private let imageView = UIImageView()
    private let startButton = UIButton()

    private let disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
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
                owner.textAlignment = .center
                owner.numberOfLines = 2
            }
            .disposed(by: disposeBag)
        
        image
            .subscribe(with: imageView) { owner, image in
                owner.image = image
                owner.contentMode = .scaleAspectFit
            }
            .disposed(by: disposeBag)
        
        startButton.rx.image().onNext(UIImage(named: "startButton_active"))
        
        startButton.rx.tap
            .bind { _ in
                let vc = AuthViewController()
                self.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    override func configure() {
                
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

