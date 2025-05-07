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
    var platform: Int?
    var platformChanged: Bool?
    var messages: [String?]?
    var infos: [InfoModel?]?
    var bannerHash: String?
    var occupancy: String?
    var stopPointGlobalId: String?
    var lineId: String?
    var tripId: String?
    
    public func getName() -> String {
        return (self.transportType ?? "") + " " + (self.label ?? "")
    }
    
    public func isDelayed() -> Bool? {
        if (plannedDepartureTime == nil || realtimeDepartureTime == nil || realtime != true) {
            return nil
        }
        
        return plannedDepartureTime! + 1000 * 60 * 4 < realtimeDepartureTime!
    }
    
    public func getInfo() -> [InfoMessage] {
        var info: [InfoMessage] = []
        
        if (cancelled == true) {
            info.append(InfoMessage(text: "Fällt aus!", icon: "x.circle.fill"))
        }
        
        if (sev == true) {
            info.append(InfoMessage(text: "SEV", icon: "bus.fill"))
        }
        
        if (infos != nil && infos!.count > 0) {
            for inf in infos! {
                if (inf != nil && inf?.message != nil) {
                    info.append(InfoMessage(text: inf!.message!, icon: "info.circle.fill"))
                }
            }
        }
        
        return info
    }
}


struct InfoModel: Codable, Hashable {
    var message: String?
    var type: String?
    var netowrk: String?
}

struct InfoMessage: Codable, Hashable {
    var text: String
    var icon: String
}
