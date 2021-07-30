//
//  PetshopData.swift
//  SwiftPetOcean
//
//  Created by Macbook on 20/07/21.
//

import Foundation


// MARK: - Welcome
struct PetshopResponse: Codable {
    let status: Bool
    let messageCode: Int
    let message: String
    let data: [PetshopData]
}

// MARK: - Datum
struct PetshopData: Codable, Identifiable {
    
    var id: String
    let serviceName, serviceAddress, serviceDescription: String?
    let imageUrl: String
    let countryID: String?
    let servicePhone: String?
    let createdDate: String?
    let createdBy, modifiedDate, modifiedBy: String?
    let isActive: Bool
    let country, createdByNavigation, modifiedByNavigation, serviceType: String?
    
    enum CodingKeys: String, CodingKey {
        case id, serviceName, serviceAddress, serviceDescription
        case imageUrl
        case countryID
        case servicePhone
        case createdDate
        case createdBy, modifiedDate, modifiedBy
        case isActive
        case country, createdByNavigation, modifiedByNavigation, serviceType
    }
}

extension PetshopData{
    static var dummyData: PetshopData{
        .init(id: "testID",
              serviceName: "Sample Service",
              serviceAddress: "Sample Address",
              serviceDescription: "Sample Description Service",
              imageUrl: "https://firebasestorage.googleapis.com/v0/b/petlife-d1aae.appspot.com/o/petshop%2Fpetshop4.jpg?alt=media&token=e8928b6d-dadc-413c-a92d-c43b8ba5a5cf", countryID: "28be38bd-df42-4ce3-97c6-f362d205b57c", servicePhone: "088238238199", createdDate: "2021-09-09", createdBy: "System", modifiedDate: "2021-09-09", modifiedBy: "System", isActive: true, country: "Indonesia", createdByNavigation: "", modifiedByNavigation: "", serviceType: "")
    }
}

