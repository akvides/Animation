//
//  Wheels_Draft.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct Wheels_Draft: View {
    
    @State private  var isRotating: Bool = false
    @State private var degree: Double = 0
    @State private var amountOfIncrease: Double = 0
    let timer = Timer.publish(every: 1.8 / 360, on: .main, in: .common).autoconnect()
    
    var turnWheel: Animation {
        .linear(duration: 2)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack{
            HStack{
                Wheel()
                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle(degrees: -self.degree))
                    .animation(isRotating ? turnWheel : .default, value: isRotating)
                Spacer()
                Wheel()
                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle(degrees: -self.degree))
                    .animation(isRotating ? turnWheel : .default, value: isRotating)
                    .padding(.trailing, -20)
            }
            .padding(.horizontal, 55)
            .padding(.top, 130)
            .onReceive(self.timer) { _ in
                self.degree += self.isRotating ? 1 : 0
                self.degree = self.degree.truncatingRemainder(dividingBy: 360)
            }
            Button(action: {isRotating.toggle()}) {
                Text("Проверка анимации")
            }
        }
    }
}

struct Wheels_Draft_Previews: PreviewProvider {
    static var previews: some View {
        Wheels_Draft()
    }
}
