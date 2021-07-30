//
//  HomeViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var serviceData : [PetshopData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    func getPetshopByCountry() {
        isLoading = true
        
        PetshopManager.shared.getTopPetshop(){ [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let result):
                
                    self.serviceData = result
                    isLoading = false
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }

}
