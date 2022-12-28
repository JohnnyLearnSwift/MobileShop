//
//  Color.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

class Colors {
    static let shared = Colors()
    
    private init() {}
    
    let orange = Color(hex: "ff6e4e")
    let black = Color(hex: "010035")
    let blackButtons = Color(hex: "282843")
    let gray = Color(hex: "cccccc")
    let grayForChevron = Color(hex: "b3b3b3")
    let grayTextSettings = Color(hex: "b7b7b7")
    let grayTrash = Color(hex: "36364d")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
