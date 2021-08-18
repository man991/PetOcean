//
//  ServiceManager.swift
//  PetOceanV3
//
//  Created by Macbook on 16/08/21.
//

import UIKit

class ServiceManger: NSObject {
    static let shared           = ServiceManger()
    private let cache           = NSCache<NSString, UIImage>()
    

    private let apiURL = Api()
    
    private override init() {}
    
    
    func getEventList(completed: @escaping (Result<[ServiceData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getEventList ) else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
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
                let decodedResponse = try decoder.decode(ServiceResponse.self, from: data)
                completed(.success(decodedResponse.data))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getDoctorList(completed: @escaping (Result<[DoctorData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getDoctorByCountry ) else {
            completed(.failure(.invalidURL))
            return
        }
               
        
        var request = URLRequest(url: url)
        
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijc5NmI0NTQ2LWQ3NTMtNDJiYS1iZmQ5LWEzYzZmYzY4MTFhZSIsIm5iZiI6MTYyOTI5NzQyMywiZXhwIjoxNjI5OTAyMjIzLCJpYXQiOjE2MjkyOTc0MjN9.tJZDBtRfAQ0ojghnbQqYzPQ4_xGQpD5eMoBAaICAcvo", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
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
                let decodedResponse = try decoder.decode(DoctorResponse.self, from: data)
                completed(.success(decodedResponse.data))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
  
}

