//
//  UserManager.swift
//  SwiftPetOcean
//
//  Created by Macbook on 27/07/21.
//

import UIKit

class UserManager: NSObject {
    
    static let shared  = UserManager()
    
    private let apiURL = Api()
    
    private override init() {}
    
    
    func authentication(Email: String, Password: String, completed: @escaping (Result<[AuthenticateData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.authenticate ) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let req = LoginRequest(email: Email, password: Password)
        let encoded = try? JSONEncoder().encode(req)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AuthenticateResponse.self, from: data)
                UserDefaults.standard.set(decodedResponse.data.name, forKey: "usernameKey")
                completed(.success([decodedResponse.data]))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func register(requestData: RegisterRequest, completed: @escaping (Result<[RegisterResponse], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.register ) else {
            completed(.failure(.invalidURL))
            return
        }
        
       
        let encoded = try? JSONEncoder().encode(requestData)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(RegisterResponse.self, from: data)
                completed(.success([decodedResponse]))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

}
