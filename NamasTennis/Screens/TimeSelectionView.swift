//
//  TimeSelectionView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 11/1/2025.
//

import SwiftUI

struct TimeSelectionView: View {
    @Binding var selectedTime: Int
    @Environment(\.presentationMode) var presentationMode

    let meditationTimes = [5, 10, 15, 20]

    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("ColorBlue"), Color("ColorBlue"), Color("ColorBlue").opacity(0.6)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea(.all, edges: .all)
            
            
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("Pick Your \nMeditation Time")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 15) {
                    ForEach(meditationTimes, id: \.self) { time in
                        Button(action: {
                            selectedTime = time
                            //print(selectedTime)
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Text("\(time) min.")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(selectedTime == time ? Color("ColorBlueLight").opacity(0.2) : Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth: 2))
                            .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
            } //: END VSTACK
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TimeSelectionView(selectedTime: .constant(5))
}
