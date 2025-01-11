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
    @State private var progress: CGFloat = 1.0
    @State private var timeRemaining: Int
    @State private var timerRunning = false
    @State private var showPopup: Bool = false
    let selectedTime: Int
    
    let totalTime: Int
    // MARK: - INIT
    init(selectedTime: Int) {
        self.selectedTime = selectedTime
        self.totalTime = selectedTime * 60
        self._timeRemaining = State(initialValue: selectedTime * 60)
    }

    
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
                
                // MARK: - PROGRESS BAR
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color("ColorGreenLight").opacity(0.2))
                        .frame(width: 300, height: 30)

                    Capsule()
                        .fill(Color("ColorGreen"))
                        .frame(width: progress * 300, height: 30)
                        .animation(.linear(duration: 1), value: progress) // Smooth animation
                    
                    
                }
                .padding(.vertical, 10)

                Text("time remaining: \(timeString(from: timeRemaining))")
                    .font(.title3)
                    .fontWeight(.bold)
                
                
                
                Spacer()
                
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
            
            if showPopup {
                VStack(spacing: 10) {
                    Text("Well done! 🎾")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Enjoy your day and stay mindful!")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)

                    Button("OK") {
                        isOnStartingViewActive = true // Go back to StartingView
                    }
                    .padding()
                    .background(Color("ColorGreen"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .frame(width: 300)
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }
        .onAppear {
            startTimer()
        }
    }
    
    // MARK: - TIMER FUNCTION
    func startTimer() {
        timerRunning = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
                progress = CGFloat(timeRemaining) / CGFloat(totalTime) // Update progress
            } else {
                timer.invalidate() // Stop timer when time runs out
                showPopup = true
                timerRunning = false
            }
        }
    }

    // MARK: - FORMAT TIME FUNCTION
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

}

#Preview {
    MeditationView(selectedTime: 5)
}
