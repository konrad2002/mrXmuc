//
//  DepartureModel.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

struct DepartureModel: Codable, Hashable {
    var plannedDepartureTime: Int64?
    var realtime: Bool?
    var delayInMinutes: Int?
    var realtimeDepartureTime: Int64?
    var transportType: String?
    var label: String?
    var divaId: String?
    var network: String?
    var trainType: String?
    var destination: String?
    var cancelled: Bool?
    var sev: Bool?
    var stopPositionNumber: Int?
    var messages: [String]?
    var infos: [String]?
    var bannerHash: String?
    var occupancy: String?
    var stopPointGlobalId: String?
    var lineId: String?
    var tripId: String?
}
