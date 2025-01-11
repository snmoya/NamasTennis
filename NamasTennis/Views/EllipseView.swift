//
//  DiamondView.swift
//  NamasTennis
//
//  Created by Sebastian Moya on 11/1/2025.
//

import SwiftUI

struct EllipseView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
        
    var body: some View {
        ZStack {
            Ellipse()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 240, height: 280, alignment: .center)

            Ellipse()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 240, height: 280, alignment: .center)
        }
    }
}

#Preview {
    ZStack{
        Color("ColorBlue")
            .ignoresSafeArea(.all, edges: .all)
        EllipseView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
