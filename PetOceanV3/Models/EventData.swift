//
//  EventData.swift
//  PetOceanV3
//
//  Created by Macbook on 16/08/21.
//

import Foundation
import Combine

struct ServiceResponse : Codable{
    let status: Bool
    let messageCode: Int
    let message: String
    let data: [ServiceData]
}

// MARK: - Datum
struct ServiceData: Codable, Identifiable {
    var id: String
    let serviceName: String?
    let serviceAddress: String?
    let serviceDescription, serviceTypeId: String?
    let imageUrl: String?
    let countryId, servicePhone, createdDate: String?
}

extension ServiceData{
    static var dummyData: ServiceData{
        .init(id: "testid", serviceName: "test", serviceAddress: "test", serviceDescription: "tezt", serviceTypeId: "tezt", imageUrl: "https://firebasestorage.googleapis.com/v0/b/petlife-d1aae.appspot.com/o/event%2FPetshow3.jpg?alt=media&token=ce73663e-4946-4367-8bcc-8d46613ec41c", countryId: "test", servicePhone: "test", createdDate: "test")
    }
}
