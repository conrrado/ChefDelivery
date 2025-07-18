//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 15/07/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State private var distanceFilterMin = 0.0
    @State private var distanceFilterMax = 25.0
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter && store.distance >= distanceFilterMin && store.distance <= distanceFilterMax
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()

                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                
                Menu("Distância") {
                    
                    Button {
                        distanceFilterMin = 0.0
                        distanceFilterMax = 25.0
                    } label: {
                        Text("Limpar filtro")
                    }

                    Divider()
                    
                    ForEach(Array(stride(from: 0, through: 20, by: 5)), id: \.self) { number in
                        Button {
                            distanceFilterMin = Double(number)
                            distanceFilterMax = Double(number + 5)
                        } label: {
                            Text("De \(number) até \(number + 5) km")
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding()
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoresContainerView()
}
