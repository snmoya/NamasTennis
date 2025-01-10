//
//  ContentView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 10/1/2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onstarting") var isStartingScreenActive: Bool = false
    
    var body: some View {
        ZStack {
                if isStartingScreenActive {
                StartingView()
            } else {
                MeditationView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
