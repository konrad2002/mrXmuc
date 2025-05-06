//
//  ContentView.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 05.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                StationSearchView()
            }.tabItem {
                Label("Station", systemImage: "bus.fill")
            }
            
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label("Home", systemImage: "globe")
            }
        }
    }
}

#Preview {
    ContentView()
}
