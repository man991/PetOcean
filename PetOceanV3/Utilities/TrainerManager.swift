//
//  TrainerManager.swift
//  PetOceanV2
//
//  Created by Macbook on 28/07/21.
//

import UIKit

class TrainerManager: NSObject {
    static let shared           = TrainerManager()
    private let cache           = NSCache<NSString, UIImage>()
    

    private let apiURL = Api()
    
    private override init() {}
    
    
    func getTopTrainer(completed: @escaping (Result<[TrainerData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getTopTrainer ) else {
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
                let decodedResponse = try decoder.decode(TrainerResponse.self, from: data)
                completed(.success(decodedResponse.data))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
  
   
}

