//
//  ContentView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 10/1/2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onstarting") var isStartingScreenActive: Bool = false
    @State private var selectedTime: Int = 10
    @State private var selectedPlayer: String = "nadal"
    
    var body: some View {
        ZStack {
                if isStartingScreenActive {
                    StartingView(selectedTime: $selectedTime, selectedPlayer: $selectedPlayer)
            } else {
                MeditationView(selectedTime: selectedTime, selectedPlayer: selectedPlayer)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
