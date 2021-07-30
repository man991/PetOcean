//
//  LoginViewModel.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var loginResponse : [AuthenticateData] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    func authenticate(email: String, password: String) {
        isLoading = true
        
        UserManager.shared.authentication(Email: email, Password: password){ [self] result in
            DispatchQueue.main.async {
                
                
                switch result {
                case .success(let userData):
                
                    self.loginResponse = userData
                    //loginviewModel.authenticate(email: registerData.Email, password: registerData.Password)
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
