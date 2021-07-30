//
//  TrainerData.swift
//  PetOceanV2
//
//  Created by Macbook on 28/07/21.
//

import Foundation
import Combine

// MARK: - Welcome
struct TrainerResponse: Codable {
    let status: Bool
    let messageCode: Int
    let message: String
    let data: [TrainerData]
}

// MARK: - Datum
struct TrainerData: Codable, Identifiable {
    var id: String{serviceId}
    var serviceId: String
    let serviceName: String?
    let imgURL: String?
    let serviceDescription, specialistDescription, experiences: String?
    let rating: String?
    let price: String?
    

    
    
//    init(from decoder: Decoder) throws {
//            // 1 - Container
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//
//            // 2 - Normal Decoding
//
//
//            // 3 - Conditional Decoding
//            if let rating =  try values.decodeIfPresent(String.self, forKey: .rating) {
//                self.rating = rating
//            }else {
//                self.rating = "N/A"
//            }
//        }

}



extension TrainerData{
    static var dummyData: TrainerData{
        .init(serviceId: "testID", serviceName: "test", imgURL: "https://firebasestorage.googleapis.com/v0/b/petlife-d1aae.appspot.com/o/trainer%2Fpedro.jpg?alt=media&token=01c40057-3c04-47a1-8575-64544c5ea72d", serviceDescription: "test", specialistDescription: "test", experiences: "test",
              rating: "NSNull",
              price: "test")
    }
}
