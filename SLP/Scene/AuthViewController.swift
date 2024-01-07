//
//  AuthViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/04.
//

import UIKit
import RxSwift
import RxCocoa

final class AuthViewController: BaseViewController {
    
    private let appleIDButton = UIButton()
    private let kakaoButton = UIButton()
    private let emailButton = UIButton()
    private let signUpButton = {
        let view = UIButton()
        view.setTitle("또는 새롭게 회원가입 하기", for: .normal)
        view.setTitleColor(Brand.green, for: .normal)
        view.titleLabel?.font = Typography.title2
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind() {
        appleIDButton.rx.image().onNext(UIImage(named: "appleLogin"))
        kakaoButton.rx.image().onNext(UIImage(named: "kakaoLogin"))
        emailButton.rx.image().onNext(UIImage(named: "continueWithEmailButton"))
        
        appleIDButton.rx.tap
            .bind { _ in
                print("appleIDLogin!")
            }
            .disposed(by: disposeBag)
        
        kakaoButton.rx.tap
            .bind { _ in
                print("kakaoLogin!")
            }
            .disposed(by: disposeBag)
        
        emailButton.rx.tap
            .bind { _ in
                print("continue with Email!")
                //로그인 화면으로 전환
                let vc = LoginViewController()
                self.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        signUpButton.rx.tap
            .bind { _ in
                let vc = SignUpViewController()
                self.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
    override func configure() {
        
        [appleIDButton, kakaoButton, emailButton, signUpButton].forEach { subView in
            view.addSubview(subView)
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(290)
        }
        
        appleIDButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(42)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(35)
            make.height.equalTo(44)
        }
        
        kakaoButton.snp.makeConstraints { make in
            make.top.equalTo(appleIDButton.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(appleIDButton.snp.horizontalEdges)
            make.height.equalTo(appleIDButton)
        }
        
        emailButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoButton.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(appleIDButton.snp.horizontalEdges)
            make.height.equalTo(appleIDButton)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(emailButton.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(appleIDButton.snp.horizontalEdges)
        }
    }
}
