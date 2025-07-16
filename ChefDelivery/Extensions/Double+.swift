//
//  Double+.swift
//  ChefDelivery
//
//  Created by Conrrado Camacho on 16/07/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
