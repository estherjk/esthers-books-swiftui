//
//  ColorExtensions.swift
//  EsthersBooks
//
//  Created by Esther Kim on 8/10/20.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// See https://stackoverflow.com/a/56874327
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

// See https://stackoverflow.com/a/62994482
extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 0)
        }

        return (r, g, b, o)
    }
}

extension Color {
    func readableForegroundColor() -> Color {
        let red = self.components.red
        let green = self.components.green
        let blue = self.components.blue
        
        // Calculate brightness based on the following formula
        // ((Red value X 299) + (Green value X 587) + (Blue value X 114)) / 1000
        // See https://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        let brightness = red * 299 + green * 587 + blue * 114
        
        return brightness > 700 ? Color.black : Color.white
    }
}
