//
//  GetData.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.06.2021.
//

import Foundation
import Alamofire

struct DataResponse: Decodable {
    var list: [Data]
}

class PizzaApiService {
    
    func loadData(complition: @escaping ([Data]) -> Void) {
        let urlString = "https://my-json-server.typicode.com/Spote777/PizzaResources/data"
        let url = URL(string: urlString)
        
        AF.request(url as! URLRequestConvertible).responseData { (response) in
            guard let data = response.data else { return }
            
            do {
                let data = try JSONDecoder()
                    .decode(DataResponse.self, from: data)
                complition(data.list)
            } catch {
                complition([])
            }
        }
    }
}
