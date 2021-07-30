//
//  RegisterViewModel.swift
//  PetOceanV2
//
//  Created by Macbook on 29/07/21.
//

import Foundation

class RegisterViewModel: ObservableObject {
    var decoder = JSONDecoder()
    @Published  var registerResponse : [RegisterResponse] = []
    @Published  var isLoading = false
    @Published  var alertItem: AlertItem?
    
    
    
    let loginviewModel = LoginViewModel()
    
 
    func register(registerData: RegisterRequest) {
        isLoading = true
        
        UserManager.shared.register(requestData: registerData) { [self] result in
            DispatchQueue.main.async {
                
                
                switch result {
                case .success(let userData):
                
                    self.registerResponse = userData
                    UserDefaults.standard.set(registerData.Name, forKey: "usernameKey")
                    loginviewModel.authenticate(email: registerData.Email, password: registerData.Password)
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

