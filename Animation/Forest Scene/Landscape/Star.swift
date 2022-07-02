//
//  Star.swift
//  Animation
//
//  Created by Василий Полторак on 18.06.2022.
//

import SwiftUI

struct Star: View {
    @Binding var isDay: Bool
    var size: CGFloat
    
    private var changeTimeOfDay: Animation {
        .linear(duration: 1.0)
        .delay(0.5)
    }

    
    var body: some View {
        GeometryReader { geometry in

            let width = geometry.size.width
            let height = geometry.size.height
            let middle = width / 2
        
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 0))
                    path.addQuadCurve(
                        to: CGPoint(x: width,
                                    y: middle),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle,
                                    y: height),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: 0,
                                    y: middle),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle,
                                    y: 0),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                }
                .foregroundColor(.white)
                .opacity(isDay ? 0 : 1)
                .animation(changeTimeOfDay, value: isDay)
                
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: middle / 3))
                    path.addQuadCurve(
                        to: CGPoint(x: width - middle / 3,
                                    y: middle),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle,
                                    y: height - middle / 3),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle / 3,
                                    y: middle),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle,
                                    y: middle / 3),
                        control: CGPoint(x: middle,
                                         y: middle)
                    )
                }
                .foregroundColor(.white)
                .rotationEffect(.degrees(45))
                .opacity(isDay ? 0 : 1)
                .animation(changeTimeOfDay, value: isDay)
                
            }
        }
        
        .frame(width: size, height: size)
    }
}

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star(isDay: .constant(false), size: 20)
            .background(Color(red: 12/255, green: 36/255, blue: 74/255))
        
    }
}
