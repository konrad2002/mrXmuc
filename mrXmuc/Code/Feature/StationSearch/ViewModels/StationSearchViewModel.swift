//
//  StationSearchViewModel.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

final class StationSearchViewModel: ObservableObject {
    @Published var fetching = false
    @Published var stations: [StationModel] = [];
    @Published var query: String = ""
    
    func fetchStations() async {
        if (query.count < 1) {
            return
        }
        
        fetching = true
        
        do {
            let stations = try await queryStations(query);
            
            self.stations = stations
            
            fetching = false
        } catch {
            print(error)
            fetching = false
        }
    }
}
