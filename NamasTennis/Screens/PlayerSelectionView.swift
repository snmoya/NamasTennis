//
//  PlayerSelectionView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 11/1/2025.
//

import SwiftUI

struct PlayerSelectionView: View {
    @Binding var selectedPlayer: String
    @Environment(\.presentationMode) var presentationMode // To close the view

    let players = ["nadal", "nole", "roger"] // Player options

    @State private var currentIndex = 0

    var body: some View {
        VStack {
            Text("Select Your Player")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            // Swipeable Player Selection
            TabView(selection: $currentIndex) {
                ForEach(players.indices, id: \.self) { index in
                    VStack {
                        Image("\(players[index])UpBF") // Display player image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(15)

                        Text(players[index].capitalized)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 250)

            // Select Button
            Button(action: {
                selectedPlayer = players[currentIndex] // Update selected player
                presentationMode.wrappedValue.dismiss() // Close the view
            }) {
                Text("Select")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 200)
                    .background(Color("ColorGreen"))
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.9))
        .cornerRadius(20)
    }
}

#Preview {
    PlayerSelectionView(selectedPlayer: .constant("nadal"))
}
