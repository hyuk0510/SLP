//
//  SLPAPI.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/11.
//

import Foundation
import Moya

enum SLPAPI {
    case kakaoLogin
    case refreshToken
    case isValidEmail(email: String)
    case signUp
}

extension SLPAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://slp.sesac.kr:27888") else {
            fatalError()
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .kakaoLogin:
            return "/v1/users/login/kakao"
        case .refreshToken:
            return "/v1/auth/refresh"
        case .isValidEmail:
            return "/v1/users/validation/email"
        case .signUp:
            return "/v1/users/join"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .kakaoLogin, .isValidEmail, .signUp:
            return .post
        case .refreshToken:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .kakaoLogin:
            return .requestPlain
        case .refreshToken:
            return .requestPlain
        case .isValidEmail(let email):
            return .requestJSONEncodable(email)
        case .signUp:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .kakaoLogin, .refreshToken, .isValidEmail, .signUp:
            return [
                "Content-Type" : "application/json",
                "SesacKey" : "\(APIKey.key)"
            ]
        }
    }
    
    
}
