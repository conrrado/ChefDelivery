//
//  BodyDetailView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 16/07/25.
//

import SwiftUI

struct BodyDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Text(store.location)
            
            Spacer()
            
            ForEach(1...store.stars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

#Preview {
    BodyDetailView(store: storesMock[0])
}
