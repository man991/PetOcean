//
//  File.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import Foundation
import Combine


struct BreederResponse: Codable {
    let status: Bool
    let messageCode: Int
    let message: String
    let data: [BreederData]
}

struct BreederData : Codable, Identifiable{
    var id: String{serviceId}
    var serviceId: String
    let serviceName, serviceAddress, serviceDescription: String?
    let createdDate, facebook, instagram, breeds: String?
    let imgURL: String?
}

extension BreederData{
    static var dummyData: BreederData{
        .init(serviceId: "sjdk", serviceName: "skdsjk", serviceAddress: "skdskd", serviceDescription: "sjdksjd", createdDate: "sjdks", facebook: "sjdksjd", instagram: "sjdksj", breeds: "sjdkjs", imgURL: "https://firebasestorage.googleapis.com/v0/b/petlife-d1aae.appspot.com/o/breeder%2Fmaincoon.jpg?alt=media&token=058f0731-c17c-4ff7-9162-bea25119cc2e")
    }
}
