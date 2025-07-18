//
//  ProductListDetailView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 16/07/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(store.products) { product in
                
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(store: storesMock[0])
}
