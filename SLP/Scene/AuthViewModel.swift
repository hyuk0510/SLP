//
//  AuthViewModel.swift
//  SLP
//
//  Created by 선상혁 on 1/29/24.
//

import Foundation
import RxSwift
import RxCocoa

final class AuthViewModel {
    struct Input {
        let text: ControlProperty<String?>
    }
    
    struct Output {
        let validation: Observable<Bool>
    }
    
//    func transform(input: Input) -> Output {
//        
//        let validation = input.text.map {  }
//        
//        return Output(validation: <#T##Observable<Bool>#>)
//    }
}
