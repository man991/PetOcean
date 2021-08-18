//
//  DoctorData.swift
//  PetOceanV3
//
//  Created by Macbook on 18/08/21.
//

import Foundation
import Combine

struct DoctorResponse : Codable{
    let status: Bool
    let messageCode: Int
    let message: String
    let data: [DoctorData]
}

// MARK: - Datum
struct DoctorData : Identifiable, Codable{
    var id: String
    let doctorName: String?
    //let countryId: String?
    let experience, phone: String?
    let price, rating: Int?
    let title: String?
        
}

extension DoctorData{
    static var dummyData: DoctorData{
        .init(id: "test", doctorName: "test", experience: "test", phone: "test", price: 250000, rating: 5, title: "test")
    }
}

