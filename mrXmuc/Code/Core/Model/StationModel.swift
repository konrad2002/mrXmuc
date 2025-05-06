//
//  StationModel.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

struct StationModel: Codable, Hashable {
    var id: String?;
    var globalId: String?;
    var divaId: Int?;
    var name: String;
    var place: String?;
    var tariffZones: String?;
    var abbreviation: String?;
    var products: [String]?;
    var latitude: Double?;
    var longitude: Double?;
}
