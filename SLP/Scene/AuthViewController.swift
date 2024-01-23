//
//  AuthViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/04.
//

import UIKit
import RxSwift
import RxCocoa
import KakaoSDKCommon
import RxKakaoSDKCommon
import KakaoSDKAuth
import RxKakaoSDKAuth
import KakaoSDKUser
import RxKakaoSDKUser
import AuthenticationServices

final class AuthViewController: BaseViewController {
    
//    private let appleIDButton = ASAuthorizationAppleIDButton(type: .signUp, style: .black)
    private let appleIDButton = UIButton()
    private let kakaoButton = UIButton()
    private let emailButton = UIButton()
    private let signUpButton =
    {
        let view = UIButton()
        view.setTitle("또는 새롭게 회원가입 하기", for: .normal)
        view.setTitleColor(Brand.green, for: .normal)
        view.titleLabel?.font = Typography.title2
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.custom(resolver: { context in
                return 290
            })]
        }
        
        sheetPresentationController?.prefersGrabberVisible = true
    }
    
    override func bind() {
        
        let signUpButtonTitle = BehaviorRelay(value: "또는 새롭게 회원가입 하기")
        
        appleIDButton.rx.image().onNext(UIImage(named: "appleLogin"))
        kakaoButton.rx.image().onNext(UIImage(named: "kakaoLogin"))
        emailButton.rx.image().onNext(UIImage(named: "continueWithEmailButton"))
        
//        signUpButtonTitle
//            .subscribe(with: self) { owner, title in
//                owner.signUpButton.setTitle(title, for: .normal)
//            }
//            .disposed(by: disposeBag)
        
        appleIDButton.rx.tap
            .bind { _ in
                print("appleIDLogin!")
            }
            .disposed(by: disposeBag)
        
        kakaoButton.rx.tap
            .subscribe(onNext: { _ in
                if (UserApi.isKakaoTalkLoginAvailable()) {
                    print("hi")
                    UserApi.shared.rx.loginWithKakaoTalk()
                        .subscribe(onNext: { oauthToken in
                            print("login success")
                            
                            AccountManager.shared.kakaoLogin()
                            _ = oauthToken
                            
                            self.kakaoAgree()
                        }, onError: { error in
                            print("error")
                        })
                        .disposed(by: self.disposeBag)
                }
            })
            .disposed(by: disposeBag)
        
        emailButton.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.present(LoginViewController(), animated: true)
            }
            .disposed(by: disposeBag)
        
        signUpButton.rx.tap
            .subscribe(with: self) { owner, _ in
//                owner.navigationController?.pushViewController(SignUpViewController(), animated: true)
                owner.present(SignUpViewController(), animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
    private func kakaoAgree() {
//        UserApi.shared.rx.me()
//            .map({ user -> User in
//                var scopes: [String] = []
//
//                if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
//                if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
//
//                if scopes.count > 0 {
//                    print("추가 동의가 필요합니다")
//
//                    throw SdkError(scopes: scopes)
//                } else {
//                    print("추가 동의가 필요하지 않습니다")
//
//                    return user
//                }
//            })
//            .retry(when: AuthApiCommon.shared.rx.incrementalAuthorizationRequired())
//            .subscribe { user in
//                print("me() success.")
//
//                //do something
//                _ = user
//            } onFailure: { error in
//                print(error)
//            }
//            .disposed(by: disposeBag)
        
        UserApi.shared.rx.me()
            .subscribe { user in
                print(user)
            } onFailure: { error in
                print(error)
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
