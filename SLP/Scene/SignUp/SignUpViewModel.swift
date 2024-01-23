//
//  SignUpViewModel.swift
//  SLP
//
//  Created by 선상혁 on 1/18/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SignupViewModel {
    
    struct Input {
        let text: ControlProperty<String?>
        //let tap: ControlEvent<Void>
    }
    
    struct Output {
        //let tap: ControlEvent<Void>
        let validStatus: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
        let validation = input.text.orEmpty.map { !$0.isEmpty }
        
        return Output(validStatus: validation)
    }
}
