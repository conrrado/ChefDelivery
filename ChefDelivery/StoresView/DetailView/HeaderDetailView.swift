//
//  HeaderDetailView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 16/07/25.
//

import SwiftUI

struct HeaderDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        Image(store.headerImage)
            .resizable()
            .scaledToFit()
        
        HStack {
            Text(store.name)
                .font(.title)
                .bold()
            
            Spacer()
            
            Image(store.logoImage)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

#Preview {
    HeaderDetailView(store: storesMock[0])
}
