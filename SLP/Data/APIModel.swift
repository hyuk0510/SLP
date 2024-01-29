//
//  APIModel.swift
//  SLP
//
//  Created by 선상혁 on 1/23/24.
//

import Foundation

struct Account: Encodable {
    let email: String
    let password: String
    let nickname: String
    let phone: String
    let deviceToken: String
}
