//
//  UIHelper.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 07.05.25.
//

import Foundation
import SwiftUICore

func getColorForDeparture(_ departure: DepartureModel) -> Color {
    switch departure.transportType {
    case "BUS", "REGIONAL_BUS":
        return Color(hex: "#005266")!
    case "SBAHN":
        return Color(hex: "#4b9144")!
    case "UBAHN":
        return Color(hex: "#0065b0")!
    case "TRAM":
        return Color(hex: "#e4010b")!
    case "BAHN":
        return Color.gray
    default:
        return Color.orange
    }
}

import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }

        guard hexSanitized.count == 6 || hexSanitized.count == 8 else {
            return nil
        }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r, g, b, a: Double
        if hexSanitized.count == 6 {
            r = Double((rgb & 0xFF0000) >> 16) / 255
            g = Double((rgb & 0x00FF00) >> 8) / 255
            b = Double(rgb & 0x0000FF) / 255
            a = 1.0
        } else {
            r = Double((rgb & 0xFF000000) >> 24) / 255
            g = Double((rgb & 0x00FF0000) >> 16) / 255
            b = Double((rgb & 0x0000FF00) >> 8) / 255
            a = Double(rgb & 0x000000FF) / 255
        }

        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}
