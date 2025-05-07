//
//  DeparturesView.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import SwiftUI

struct DeparturesView: View {
    let station: StationModel
    
    @ObservedObject private var viewModel = DeparturesViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.departures, id: \.self) {departure in
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(timeAsString(departure.plannedDepartureTime))
                                if (departure.realtime ?? false) {
                                    Text(timeAsString(departure.realtimeDepartureTime))
                                        .foregroundStyle((departure.isDelayed() ?? false) ? Color.red : Color.green)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text(departure.label ?? "-")
                                    .bold()
                                    .foregroundStyle(getColorForDeparture(departure))
                                Text(departure.destination ?? "-")
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        
                        HStack {
                            Spacer()
                            
                            VStack (alignment: .trailing) {
                                ForEach(departure.getInfo(), id: \.self) {info in
                                    HStack {
                                        Text(info.text)
                                        Image(systemName: info.icon)
                                    }
                                    .foregroundStyle(.red)
                                    .font(.caption)
                                }
                            }
                        }
                    }
                }
            }
        }
        .overlay {
            if (!viewModel.fetching && viewModel.departures.isEmpty) {
                ContentUnavailableView("Keine Abfahrten", systemImage: "bus.fill")
            }
        }
        .navigationTitle(station.name)
        .task {
            await viewModel.fetchDepartures(stationId: (station.globalId ?? station.id)!)
        }
        .refreshable {
            await viewModel.fetchDepartures(stationId: (station.globalId ?? station.id)!)
        }
    }
}

#Preview {
    NavigationStack {
        DeparturesView(station: StationModel(id: "de:09162:580", globalId: "de:09162:580", divaId: 580, name: "Max-Weber-Platz", place: "München", tariffZones: "m", latitude: 48.135693, longitude: 11.598355))
    }
}
