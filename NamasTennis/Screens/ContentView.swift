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
    
    var body: some View {
        ZStack {
                if isStartingScreenActive {
                    StartingView(selectedTime: $selectedTime)
            } else {
                MeditationView(selectedTime: selectedTime)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
