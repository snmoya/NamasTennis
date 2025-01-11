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
    @State private var buttonOffset: CGFloat = 0
    
    // MARK: - BODY
    var body: some View {
       ZStack {
           
           LinearGradient(
               gradient: Gradient(colors: [Color("ColorBlue"), Color("ColorBlue"), Color("ColorBlue").opacity(0.6)]),
               startPoint: .top,
               endPoint: .bottom
           )
           .ignoresSafeArea(.all, edges: .all)
           
           
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
                   EllipseView(ShapeColor: .white, ShapeOpacity: 0.2)
                   
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
                   
                   HStack {
                       Capsule()
                           .fill(Color("ColorGreen"))
                           .frame(width: buttonOffset + 80)
                        
                       Spacer()
                   }
                   
                   // DRAG CIRCLE
                   HStack {
                       ZStack {
                           Circle()
                               .fill(Color("ColorGreenLight"))
                           Circle()
                               .fill(.black.opacity(0.15))
                               .padding(8)
                           Image(systemName: "chevron.right.2")
                               .font(.system(size: 24, weight: .bold))
                       }
                       .foregroundColor(.white)
                       .frame(width: 80, height: 80, alignment: .center)
                       .offset(x : buttonOffset)
                       .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnStartingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                    }
                                }
                            }
                       )
                       
                       Spacer()
                   } //: HSTACK
                       
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
