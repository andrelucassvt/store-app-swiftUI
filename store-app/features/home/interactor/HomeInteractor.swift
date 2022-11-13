//
//  HomeInteractor.swift
//  store-app
//
//  Created by André  Lucas on 07/11/22.
//

import Foundation
import SwiftUI

protocol HomeProtocol: AnyObject {
    func getProducts(completion: @escaping (Result<[ProductEntity], Error>) -> Void)
    func findProduct(search: String)
}


class HomeInteractor: HomeProtocol {
    
    func findProduct(search: String) {

    }
    
    func getProducts(completion: @escaping (Result<[ProductEntity], Error>) -> Void) {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data , response, error) in
            if let error = error {
              print("Error with fetching prod: \(error)")
              return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code \(response.hashValue)")
              return
            }
            
            if httpResponse.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.sync {
                    do {
                        let result = try JSONDecoder().decode([ProductEntity].self, from: data)
                        completion(.success(result))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}
