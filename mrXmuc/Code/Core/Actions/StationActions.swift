//
//  StationActions.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

func getStationById(_ stationId: String) async throws -> StationModel {
    do {
        let station: StationModel = try await mvgRestService.get(path: "zdm/stations/" + stationId)
        
        return station
    } catch {
        throw error
    }
}

func queryStations(_ query: String) async throws -> [StationModel] {
    do {
        let stations: [StationModel] = try await mvgApiService.get(path: "locations?query=" + query + "&locationTypes=STATION")
        return stations
    } catch {
        throw error
    }
}
