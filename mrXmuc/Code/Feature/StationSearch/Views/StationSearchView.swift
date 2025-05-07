//
//  StationSearch.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import SwiftUI

struct StationSearchView: View {
    
    @ObservedObject private var viewModel = StationSearchViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.stations, id: \.self) { station in
                
                    NavigationLink (station.name) {
                        DeparturesView(station: station)
                    }
                    
                }
            }
        }
        .overlay {
            if (!viewModel.fetching && viewModel.stations.isEmpty) {
                ContentUnavailableView.search
            }
        }
        .searchable(text: $viewModel.query)
        .task(id: viewModel.query) {
            await viewModel.fetchStations()
        }
        .navigationTitle("Abfahrten")
    }
}

#Preview {
    NavigationStack {
        
        StationSearchView()
    }
}
