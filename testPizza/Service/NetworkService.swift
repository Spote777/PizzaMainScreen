//
//  GetData.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.06.2021.
//

import Foundation

class NetworkService {
    
    // MARK: - Properties

    let urlString = "https://my-json-server.typicode.com/Spote777/PizzaResources/data"
    
    // MARK: - Method
    
    func request(completion: @escaping (Result<Data, Error>)-> Void) {
        let url = URL(string: urlString)
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
