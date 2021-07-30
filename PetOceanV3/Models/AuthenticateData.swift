//
//  AuthenticateData.swift
//  SwiftPetOcean
//
//  Created by Macbook on 21/07/21.
//

import Foundation

import Combine

struct LoginRequest: Codable {
    
    let email: String
    let password: String
}

class  AuthenticateResponse: Codable {
    let status: Bool
    let messageCode: Int
    let message: String
    var data: AuthenticateData
}


class  AuthenticateData: Codable {
    let userId, countryId, name, email: String?
    let token: String?
}
