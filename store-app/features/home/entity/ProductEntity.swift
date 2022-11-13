//
//  ProductEntity.swift
//  store-app
//
//  Created by André  Lucas on 07/11/22.
//

import Foundation


struct ProductEntity: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Double
    var category: String
    var description: String
    var image: String
}
