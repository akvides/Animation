//
//  Wheel.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct Wheel: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
        
            ZStack {
                ForEach(0..<5) { iteration in
                    Path { path in
                        path.move(to: CGPoint(x: width * 0.175, y: width * 0.125))
                        path.addLine(to: CGPoint(x: width * 0.825, y: width * 0.125))
                        path.addLine(to: CGPoint(x: width * 0.875, y: width * 0.175))
                        path.addLine(to: CGPoint(x: width * 0.875, y: width * 0.825))
                        path.addLine(to: CGPoint(x: width * 0.825, y: width * 0.875))
                        path.addLine(to: CGPoint(x: width * 0.175, y: width * 0.875))
                        path.addLine(to: CGPoint(x: width * 0.125, y: width * 0.825))
                        path.addLine(to: CGPoint(x: width * 0.125, y: width * 0.175))
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
                        path.move(to: CGPoint(x: width * 0.5, y: width * 0.2))
                        path.addLine(to: CGPoint(x: width * 0.53, y: width * 0.2))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.55, y: width * 0.22),
                            control: CGPoint(x: width * 0.55, y: width * 0.2)
                        )
                        path.addLine(to: CGPoint(x: width * 0.53, y: width * 0.38))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.515, y: width * 0.4),
                            control: CGPoint(x: width * 0.53, y: width * 0.4)
                        )
                        path.addLine(to: CGPoint(x: width * 0.485, y: width * 0.4))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.47, y: width * 0.38),
                            control: CGPoint(x: width * 0.47, y: width * 0.395)
                        )
                        path.addLine(to: CGPoint(x: width * 0.45, y: width * 0.22))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.47, y: width * 0.2),
                            control: CGPoint(x: width * 0.45, y: width * 0.2)
                        )
                    }
                    .rotationEffect(.degrees(Double(iteration) * 72))
                }
                
                ForEach(0..<5) { iteration in
                    Path { path in
                        path.move(to: CGPoint(x: width * 0.5, y: width * 0.2))
                        path.addLine(to: CGPoint(x: width * 0.55, y: width * 0.2))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.565, y: width * 0.215),
                            control: CGPoint(x: width * 0.565, y: width * 0.2)
                        )
                        path.addLine(to: CGPoint(x: width * 0.51, y: width * 0.325))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.49, y: width * 0.325),
                            control: CGPoint(x: width * 0.5, y: width * 0.34)
                        )
                        path.addLine(to: CGPoint(x: width * 0.435, y: width * 0.215))
                        path.addQuadCurve(
                            to: CGPoint(x: width * 0.5, y: width * 0.2),
                            control: CGPoint(x: width * 0.435, y: width * 0.2)
                        )
                    }
                    .rotationEffect(.degrees((Double(iteration) * 72) + 36))
                }
            }
        }
    }
}

struct Wheel_Previews: PreviewProvider {
    static var previews: some View {
        Wheel()
            .frame(width: 150, height: 150)
    }
}
