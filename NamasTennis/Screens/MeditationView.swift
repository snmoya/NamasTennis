//
//  MeditationView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 11/1/2025.
//

import SwiftUI

struct MeditationView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onstarting") var isOnStartingViewActive: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing:20) {
                // MARK: - HEADER
                
                Spacer()
                
                ZStack {
                    EllipseView(ShapeColor: Color("ColorGreenLight"), ShapeOpacity: 0.1)
                    
                    Image("nadalMedBF")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                // MARK: - CENTER
                
                Text("Focus, center yourself and let the distractions bounce away.")
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // MARK: - FOOT
                
                Spacer()
                
                Button(action: {
                    isOnStartingViewActive = true
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        
                } //: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(Color("ColorGreen"))
                
            }//: VSTACK
        }
    }
}

#Preview {
    MeditationView()
}
