//
//  ProductListDetailView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 16/07/25.
//

import SwiftUI

struct ProductListDetailView: View {
    
    let store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        Text("Produtos")
            .font(.title2)
            .bold()
            .padding()
        
        ForEach(store.products) { product in
            
            Button {
                selectedProduct = product
            } label: {
                HStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.name)
                            .bold()
                        
                        Text(product.description)
                            .foregroundColor(.black.opacity(0.5))
                            .multilineTextAlignment(.leading)
                        
                        Text(product.formattedPrice)
                    }
                    
                    Spacer()
                    
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                }
                .padding()
                .foregroundColor(.black)
            }
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview {
    ProductListDetailView(store: storesMock[0])
}
