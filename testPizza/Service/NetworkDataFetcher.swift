//
//  NetworkDataFetcher.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.06.2021.
//

import Foundation

class NetworkDataFetcher {
    
    // MARK: - Properties

    let networkService = NetworkService()
    
    // MARK: - Method

    func fetchData(response: @escaping (PizzaResponse?) -> Void) {
        networkService.request { (result) in
            switch result {
            case .success(let data):
                do {
                    let pizzaData = try JSONDecoder().decode(PizzaResponse.self, from: data)
                    response(pizzaData)
                } catch let jsonError {
                    print("Failed to decode json", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
        
    }
}
