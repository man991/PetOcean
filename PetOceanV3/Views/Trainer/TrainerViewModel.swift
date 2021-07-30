//
//  TrainerViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import Foundation

class TrainerViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var petshopData : [TrainerData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
//    func getPetshopByCountry() {
//        isLoading = true
//        
//        PetshopManager.shared.getPetshopByCountry(){ [self] result in
//            DispatchQueue.main.async {
//                
//                switch result {
//                case .success(let result):
//                
//                    self.petshopData = result
//                    isLoading = false
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }

}
