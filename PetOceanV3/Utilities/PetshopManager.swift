//
//  NetworkManager.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import UIKit

class PetshopManager: NSObject {
    
    static let shared           = PetshopManager()
    private let cache           = NSCache<NSString, UIImage>()
    
   
//    static let baseURL          = "https://seanallen-course-backend.herokuapp.com/"
//    private let appetizerURL    = baseURL + "swiftui-fundamentals/appetizers"
    
    private let apiURL = Api()
    
    private override init() {}
    
    
    func getPetshopByCountry(completed: @escaping (Result<[PetshopData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getPetshopByCountry ) else {
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
                let decodedResponse = try decoder.decode(PetshopResponse.self, from: data)
                completed(.success(decodedResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getTopPetshop(completed: @escaping (Result<[PetshopData], ApiError>) -> Void) {
        guard let url = URL(string: apiURL.getTopPetshop ) else {
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
                let decodedResponse = try decoder.decode(PetshopResponse.self, from: data)
                completed(.success(decodedResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
