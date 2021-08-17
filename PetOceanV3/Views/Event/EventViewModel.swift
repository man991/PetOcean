//
//  EventViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 16/08/21.
//

import Foundation

class EventViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var serviceData : [ServiceData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    func getEventList() {
        isLoading = true
        
        ServiceManger.shared.getEventList(){ [self] result in
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
