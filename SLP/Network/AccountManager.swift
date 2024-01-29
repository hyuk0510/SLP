//
//  AccountManager.swift
//  SLP
//
//  Created by 선상혁 on 1/15/24.
//

import Foundation
import Moya

final class AccountManager {
    
    static let shared = AccountManager()
    
    private init() {}
    
    private lazy var provider = MoyaProvider<SLPAPI>()
    
    func kakaoLogin() {
        provider.request(.kakaoLogin) { result in
            switch result {
            case .success(let response):
                print("success", response.statusCode, response.data)
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func isValidEmail(email: String) {
        provider.request(.isValidEmail(email: email)) { result in
            switch result {
            case .success(let response):
                print("success", response.statusCode, response.data)
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func signUp(account: Account) {
        provider.request(.signUp(account: account)) { result in
            switch result {
            case .success(let response):
                print("success", response.statusCode, response.data)
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
