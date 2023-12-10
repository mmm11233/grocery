//
//  ViewModel.swift
//  GroceryShop
//
//  Created by Mariam Joglidze on 10.12.23.
//

import SwiftUI

class ProductsViewModel: ObservableObject {

      var products: [Product] = [
        Product(imageName: "apple", totalQuantity: 0, totalPrice: 12, quantity: 0),
        Product(imageName: "Banana", totalQuantity: 0, totalPrice: 10, quantity: 0),
        Product(imageName: "cherry", totalQuantity: 0, totalPrice: 13, quantity: 0),
        Product(imageName: "peach", totalQuantity: 0, totalPrice: 10, quantity: 0),
        Product(imageName: "pineapple", totalQuantity: 0, totalPrice: 11, quantity: 0),
        Product(imageName: "straw", totalQuantity: 0, totalPrice: 15, quantity: 0),
    ]
}

