//
//  DepartureActions.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

func getDeparturesByStationId(_ stationId: String) async throws -> [DepartureModel] {
    do {
        let departures: [DepartureModel] = try await mvgApiService.get(path: "departures?globalId=" + stationId + "&limit=100&transportTypes=UBAHN,REGIONAL_BUS,BUS,TRAM,SBAHN,BAHN")
        return departures
    } catch {
        throw error
    }
}
