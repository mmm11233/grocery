//
//  ContentView.swift
//  GroceryShop
//
//  Created by Mariam Joglidze on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductsViewModel()

    @State private var totalProducts: Int = 0
    @State private var totalPrice: Int = 0

    func updateTotalValues() {
        totalProducts = viewModel.products.map { $0.quantity }.reduce(0, +)
        totalPrice = viewModel.products.reduce(0) { $0 + $1.quantity * $1.totalPrice }
    }
    
    var body: some View {
        VStack {
            Text("Total Quantity: \(totalProducts)")
                .foregroundStyle(.black)
                .font(Font.system(.headline))
            Spacer().frame(height: 8)
            Text("Total Price: \(totalPrice)")
                .foregroundStyle(.black.opacity(0.6))
                .font(Font.system(.headline))
            
            ScrollView(content: {
                LazyVStack(alignment: .leading, content: {
                    ForEach(Array(viewModel.products.enumerated()), id: \.1.id) { index, product in
                        productRow(index: index, product: product)
                    }
                })
            })
        }
    }
    
    private func productRow(index: Int, product: Product) -> some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 50, height: 50)

            Text("Quantity: \(product.quantity)")

            Button(action: {
                if viewModel.products[index].quantity > 0 {
                    viewModel.products[index].quantity -= 1
                    updateTotalValues()
                }
            }) {
                Image(systemName: "minus.circle")
            }

            Button(action: {
                viewModel.products[index].quantity += 1
                updateTotalValues()
            }) {
                Image(systemName: "plus.circle")
            }

            Button(action: {
                viewModel.products.remove(at: index)
                updateTotalValues()
            }) {
                Image(systemName: "trash")
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}
