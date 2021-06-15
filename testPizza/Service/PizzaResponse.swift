//
//  PizzaResponse.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.06.2021.
//

import Foundation

struct PizzaResponse: Decodable {
    var menu: [FoodModel]?
    var categories: [CategoryModel]?
    var banners: [BannerModel]?
}






