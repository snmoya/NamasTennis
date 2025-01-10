//
//  StartingView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 11/1/2025.
//

import SwiftUI

struct StartingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onstarting") var isOnStartingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    
    // MARK: - BODY
    var body: some View {
       ZStack {
           
           LinearGradient(
               gradient: Gradient(colors: [Color("ColorBlue"), Color("ColorBlue"), Color("ColorBlue").opacity(0.6)]),
               startPoint: .top,
               endPoint: .bottom
           )
           .ignoresSafeArea()
           
           VStack(spacing:20) {
               //MARK: - HEADER
               
               Spacer()
               
               VStack(spacing: 0) {
                   Text("InnerACE")
                       .font(.system(size: 60))
                       .fontWeight(.bold)
                       .foregroundColor(.white)
                   
                   Text(" This is your moment to unwind and ace your inner peace. Game, set and Zen!")
                       .font(.title3)
                       .fontWeight(.light)
                       .foregroundColor(.white)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 20)
               }
               
               //MARK: - CENTER
               
               ZStack {
                   
                   Image("nadalUpBF")
                       .resizable()
                       .scaledToFit()
                   
               }//: CENTER
               
               Spacer()
               
               //MARK: - FOOTER
               ZStack {
                   Capsule()
                       .fill(Color.white.opacity(0.2))
                    
                   Text("Step into Court")
                       .font(.system(.title3, design: .rounded))
                       .fontWeight(.bold)
                       .foregroundColor(.white)
                       
               }//: FOOTER
               .frame(width: buttonWidth, height: 80, alignment: .center)
               .padding()
               
           } //: END VSTACK
        }//: END ZSTACK

    }
}

#Preview {
    StartingView()
}
