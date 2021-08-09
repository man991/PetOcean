//
//  BreederViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import Foundation

class BreederViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var breederData : [BreederData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    func getBreeders() {
        isLoading = true
        
        BreederManager.shared.getBreederList(){ [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let result):
                
                    self.breederData = result
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
