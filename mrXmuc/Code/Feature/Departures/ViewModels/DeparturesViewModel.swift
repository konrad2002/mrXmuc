//
//  DeparturesViewModel.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import Foundation

final class DeparturesViewModel: ObservableObject {
    @Published var fetching = false
    @Published var departures: [StationModel] = [];
    @Published var query: String = ""
    
}
