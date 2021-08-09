//
//  BreederManager.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import UIKit

class BreederManager: NSObject {
    static let shared           = BreederManager()
    private let cache           = NSCache<NSString, UIImage>()
    

    private let apiURL = Api()
    
    private override init() {}
    
    
    func getBreederList(completed: @escaping (Result<[BreederData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getBreederList ) else {
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
                let decodedResponse = try decoder.decode(BreederResponse.self, from: data)
                completed(.success(decodedResponse.data))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
