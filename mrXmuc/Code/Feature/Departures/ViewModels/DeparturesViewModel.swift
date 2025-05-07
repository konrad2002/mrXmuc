//
//  DeparturesViewModel.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

@MainActor
final class DeparturesViewModel: ObservableObject {
    @Published var fetching = false
    @Published var departures: [DepartureModel] = [];
    @Published var query: String = ""
    
    
    func fetchDepartures(stationId: String) async {
        fetching = true
        
        do {
            let departures = try await getDeparturesByStationId(stationId);
            
            self.departures = departures
            
            fetching = false
        } catch {
            print(error)
            fetching = false
        }
    }
}
