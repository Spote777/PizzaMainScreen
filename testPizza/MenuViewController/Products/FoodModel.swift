//
//  FoodModel.swift
//  testPizza
//
//  Created by Павел Заруцков on 15.06.2021.
//

import Foundation

struct FoodModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let priceFrom: Int
    let categoryID: Int?
    let categoryName: String
    let image: String
}
