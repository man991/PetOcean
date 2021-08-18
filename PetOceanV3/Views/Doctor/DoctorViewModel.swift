//
//  DoctorViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 18/08/21.
//

import Foundation

class DoctorViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var doctorData : [DoctorData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    func getDoctorList() {
        isLoading = true
        
        ServiceManger.shared.getDoctorList(){ [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let result):
                
                    self.doctorData = result
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
