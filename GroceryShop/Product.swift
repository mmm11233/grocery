//
//  Product.swift
//  GroceryShop
//
//  Created by Mariam Joglidze on 10.12.23.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    var totalQuantity: Int
    var totalPrice: Int
    var quantity: Int
}
