//
//  SignUpViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/04.
//

import UIKit
import RxSwift
import RxCocoa

final class SignUpViewController: BaseViewController {
    
    private let emailLabel = {
        let view = UILabel()
        view.text = "이메일"
        view.font = Typography.title2
        return view
    }()
    
    private let nicknameLabel = {
        let view = UILabel()
        view.text = "닉네임"
        view.font = Typography.title2
        return view
    }()
    
    private let phoneNumberLabel = {
        let view = UILabel()
        view.text = "연락처"
        view.font = Typography.title2
        return view
    }()
    
    private let pwLabel = {
        let view = UILabel()
        view.text = "비밀번호"
        view.font = Typography.title2
        return view
    }()
    
    private let pwCheckLabel = {
        let view = UILabel()
        view.text = "비밀번호 확인"
        view.font = Typography.title2
        return view
    }()
    
    private let emailTextField = SignUpTextField(str: "이메일을 입력하세요")
    private let nicknameTextField = SignUpTextField(str: "닉네임을 입력하세요")
    private let phoneNumberTextField = SignUpTextField(str: "전화번호를 입력하세요")
    private let pwTextField = SignUpTextField(str: "비밀번호를 입력하세요")
    private let pwCheckTextField = SignUpTextField(str: "비밀번호를 한 번 더 입력하세요")
    
    private let emailCheckButton = {
        let view = UIButton()
        view.backgroundColor = Brand.inactive
        view.setTitle("중복 확인", for: .normal)
        view.titleLabel?.font = Typography.title2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let signUpButton = {
        let view = UIButton()
        view.backgroundColor = Brand.inactive
        view.setTitle("가입하기", for: .normal)
        view.titleLabel?.font = Typography.title2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let email = BehaviorRelay(value: "이메일")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind() {
        
//        email
//            .subscribe(with: self) { owner, text in
//                owner.
//            }
    }
    
    override func configure() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = Brand.black
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: Typography.title1 ]
        navigationController?.navigationBar.backgroundColor = Brand.white
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "회원가입"
        self.sheetPresentationController?.prefersGrabberVisible = true
        
        [emailLabel, nicknameLabel, phoneNumberLabel, pwLabel, pwCheckLabel, emailTextField, emailCheckButton, nicknameTextField, phoneNumberTextField, pwTextField, pwCheckTextField, signUpButton].forEach { subView in
            view.addSubview(subView)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.equalTo(emailLabel.snp.leading)
            make.height.equalTo(44)
        }
        
        emailCheckButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.top)
            make.leading.equalTo(emailTextField.snp.trailing).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(emailTextField.snp.height)
            make.width.equalTo(100)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.leading.equalTo(emailLabel.snp.leading)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(emailTextField.snp.height)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(24)
            make.leading.equalTo(emailLabel.snp.leading)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(nicknameTextField.snp.horizontalEdges)
            make.height.equalTo(emailTextField.snp.height)
        }
        
        pwLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(24)
            make.leading.equalTo(emailLabel.snp.leading)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(pwLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(nicknameTextField.snp.horizontalEdges)
            make.height.equalTo(emailTextField.snp.height)
        }
        
        pwCheckLabel.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(24)
            make.leading.equalTo(emailLabel.snp.leading)
        }
        
        pwCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(pwCheckLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(nicknameTextField.snp.horizontalEdges)
            make.height.equalTo(emailTextField.snp.height)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(nicknameTextField.snp.horizontalEdges)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(45)
            make.height.equalTo(44)
        }
    }
    
    @objc
    private func backButtonPressed() {
        dismiss(animated: true)
    }
}
