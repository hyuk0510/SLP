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
    
    private let emailLabel = SignUpLabel(text: "이메일")
    private let nicknameLabel = SignUpLabel(text: "닉네임")
    private let phoneNumberLabel = SignUpLabel(text: "연락처")
    private let pwLabel = SignUpLabel(text: "비밀번호")
    private let pwCheckLabel = SignUpLabel(text: "비밀번호 확인")
    
    private let emailTextField = SignUpTextField(placeholdertext: "이메일을 입력하세요")
    private let nicknameTextField = SignUpTextField(placeholdertext: "닉네임을 입력하세요")
    private let phoneNumberTextField = SignUpTextField(placeholdertext: "전화번호를 입력하세요")
    private let pwTextField = SignUpTextField(placeholdertext: "비밀번호를 입력하세요")
    private let pwCheckTextField = SignUpTextField(placeholdertext: "비밀번호를 한 번 더 입력하세요")
    
    private lazy var emailCheckButton = SLPButton(title: "중복 확인")
    private lazy var signUpButton = SLPButton(title: "가입하기")
    
    private var viewModel = SignupViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind() {
        
        let input = SignupViewModel.Input(text: emailTextField.rx.text)
        let output = viewModel.transform(input: input)
        let isValidSignUp = BehaviorRelay(value: false)
        
        
        output.validStatus
            .bind(to: emailCheckButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        output.validStatus
            .subscribe(with: self) { owner, valid in
                owner.emailCheckButton.backgroundColor = valid ? Brand.green : Brand.inactive
            }
            .disposed(by: disposeBag)
        
        emailCheckButton.rx.tap
            .subscribe(with: self) { owner, _ in
                print("emailCheckButton Pressed")
                AccountManager.shared.isValidEmail(email: "")
            }
            .disposed(by: disposeBag)
        
        
        signUpButton.rx.tap
            .subscribe(with: self) { owner, _ in
                print("signUpbutton Pressed")
//                AccountManager.shared.signUp()
            }
            .disposed(by: disposeBag)
        
    }
    
    override func configure() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = Brand.black
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
