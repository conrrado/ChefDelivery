//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationBar()
            .padding(.horizontal, 15)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                OrderTypeGridView()
                CarouselTabView()
                StoresContainerView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
