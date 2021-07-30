//
//  RegisterModel.swift
//  PetOceanV2
//
//  Created by Macbook on 29/07/21.
//

import Foundation

struct RegisterRequest: Codable {
    var CountryId, Name, Phone, Email: String
    var UserName, Password: String
    
    init(countryId: String, name: String, phone: String, email: String, userName: String, password: String) {
        self.CountryId = countryId
        self.Name = name
        self.Phone = phone
        self.Email = email
        self.UserName = userName
        self.Password = password
    }
}

struct RegisterResponse: Codable {
    var status: Bool
    var messageCode: Int
    var message: String
}

extension RegisterRequest{
    static var dummyData: RegisterRequest{
        .init(countryId: "tete", name: "test", phone: "test", email: "test", userName: "test", password: "tesd")
    }
}





