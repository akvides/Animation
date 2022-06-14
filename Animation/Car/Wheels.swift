//
//  Wheels.swift
//  Animation
//
//  Created by Василий Полторак on 11.06.2022.
//

import SwiftUI

struct Wheels: View {
    
    let width: CGFloat
    
    @Binding var isRotating: Bool
    @Binding var speed: Speed
    @State private var degree: Double = 0
    
    
    var turnWheel: Animation {
        .linear(duration: 2)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        let timer = Timer.publish(every: (1.8 / speed.rawValue) / 360, on: .main, in: .common).autoconnect()
        VStack{
            HStack{
                Wheel()
                    .frame(width: width * 0.2285714286, height: width * 0.2285714286)
                    .rotationEffect(Angle(degrees: -self.degree))
                    .animation(isRotating ? turnWheel : .default, value: isRotating)
                Spacer()
                Wheel()
                    .frame(width: width * 0.2285714286, height: width * 0.2285714286)
                    .rotationEffect(Angle(degrees: -self.degree))
                    .animation(isRotating ? turnWheel : .default, value: isRotating)
                    .padding(.trailing, width * -0.05714285714)
            }
            .padding(.horizontal, width * 0.1571428571)
            .padding(.top, width * 0.3714285714)
            .onReceive(timer) { _ in
                self.degree += self.isRotating ? 1 : 0
                self.degree = self.degree.truncatingRemainder(dividingBy: 360)
            }
        }
    }
}

struct Wheels_Previews: PreviewProvider {
    static var previews: some View {
        Wheels(width: 350, isRotating:  .constant(false), speed: .constant(.third))
    }
}
