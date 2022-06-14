//
//  Wheel_Draft.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct Wheel_Draft: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
        
            ZStack {
                
                ForEach(0..<5) { iteration in
                    Path { path in
                        path.move(to: CGPoint(x: 35, y: 25))
                        path.addLine(to: CGPoint(x: 165, y: 25))
                        path.addLine(to: CGPoint(x: 175, y: 35))
                        path.addLine(to: CGPoint(x: 175, y: 165))
                        path.addLine(to: CGPoint(x: 165, y: 175))
                        path.addLine(to: CGPoint(x: 35, y: 175))
                        path.addLine(to: CGPoint(x: 25, y: 165))
                        path.addLine(to: CGPoint(x: 25, y: 35))
                    }
                    .rotationEffect(.degrees(Double(iteration) * 18))
                }
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: width * 0.7, height: height * 0.7)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: width * 0.13, height: height * 0.13)
                
                ForEach(0..<5) { iteration in
                    Path { path in
                        path.move(to: CGPoint(x: 100, y: 40))
                        path.addLine(to: CGPoint(x: 106, y: 40))
                        path.addQuadCurve(
                            to: CGPoint(x: 110, y: 44),
                            control: CGPoint(x: 110, y: 40)
                        )
                        path.addLine(to: CGPoint(x: 106, y: 76))
                        path.addQuadCurve(
                            to: CGPoint(x: 103, y: 80),
                            control: CGPoint(x: 106, y: 80)
                        )
                        path.addLine(to: CGPoint(x: 97, y: 80))
                        path.addQuadCurve(
                            to: CGPoint(x: 94, y: 76),
                            control: CGPoint(x: 94, y: 79)
                        )
                        path.addLine(to: CGPoint(x: 90, y: 44))
                        path.addQuadCurve(
                            to: CGPoint(x: 94, y: 40),
                            control: CGPoint(x: 90, y: 40)
                        )
                    }
                    .rotationEffect(.degrees(Double(iteration) * 72))
                }
                
                ForEach(0..<5) { iteration in
                    Path { path in
                        path.move(to: CGPoint(x: 100, y: 40))
                        path.addLine(to: CGPoint(x: 110, y: 40))
                        path.addQuadCurve(
                            to: CGPoint(x: 113, y: 43),
                            control: CGPoint(x: 113, y: 40)
                        )
                        path.addLine(to: CGPoint(x: 102, y: 65))
                        path.addQuadCurve(
                            to: CGPoint(x: 98, y: 65),
                            control: CGPoint(x: 100, y: 68)
                        )
                        path.addLine(to: CGPoint(x: 87, y: 43))
                        path.addQuadCurve(
                            to: CGPoint(x: 100, y: 40),
                            control: CGPoint(x: 87, y: 40)
                        )
                    }
                    .rotationEffect(.degrees((Double(iteration) * 72) + 36))
                }
            }
        }
    }
}

struct Wheel_Draft_Previews: PreviewProvider {
    static var previews: some View {
        Wheel_Draft()
            .frame(width: 200, height: 200)
    }
}
