//
//  CarBody.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct CarBody: View {
    
    let width: CGFloat
    private var height: CGFloat {
        width * 0.6
    }
    
    @Binding var isCarWent: Bool
    @Binding var color: Color
    
    private var foreverAnimation: Animation {
        .easeInOut(duration: 1)
        .repeatForever()
    }
    
    var body: some View {
        VStack {
            GeometryReader {geometry in
                let width = geometry.size.width
                
                ZStack{
                    ZStack{
                        Carcase(width: width)
                            .foregroundColor(color)
                        BorderCarcase(width: width)
                        FrontWindow(width: width)
                        BorderFrontWindow(width: width)
                        Door(width: width, color: $color)
                        DoorHandle(width: width, color: $color)
                        RearWindow(width: width)
                        BorderRearWindow(width: width)
                        HeadLight(width: width)
                    }
                    .offset(y: isCarWent ? -(width * 0.02857142857) : 0)
                    .rotationEffect(.degrees(isCarWent ? 1 : 0))
                    .animation(isCarWent ? foreverAnimation : .default, value:  isCarWent)
                    Wheels(width: self.width, isRotating: $isCarWent)
                }
            }
        }
        .frame(width: width, height: height)
        .zIndex(12)
    }
}



struct CarBody_Previews: PreviewProvider {
    static var previews: some View {
        CarBody(width: 350, isCarWent: .constant(false), color: .constant(.black))
    }
}

struct Carcase: View {
    
    let width: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5,
                                  y: width * 0.02857142857))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.8,
                            y: width * 0.2285714286),
                control: CGPoint(x: width * 0.8857142857,
                                 y: width * 0.02857142857)
            )
            path.addLine(to: CGPoint(x: width * 0.9142857143,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width,
                            y: width * 0.5142857143),
                control: CGPoint(x: width,
                                 y: width * 0.2285714286)
            )
            path.addLine(to: CGPoint(x: width * 0.9142857143,
                                     y: width * 0.5142857143))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.7857142857,
                            y: width * 0.3657142857),
                control: CGPoint(x: width * 0.9142857143,
                                 y: width * 0.3657142857)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.6571428571,
                            y: width * 0.5142857143),
                control: CGPoint(x: width * 0.6571428571,
                                 y: width * 0.3714285714)
            )
            path.addLine(to: CGPoint(x: width * 0.4,
                                     y: width * 0.5142857143))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.2714285714,
                            y: width * 0.3657142857),
                control: CGPoint(x: width * 0.4,
                                 y: width * 0.3657142857)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.1428571429,
                            y: width * 0.5142857143),
                control: CGPoint(x: width * 0.1428571429,
                                 y: width * 0.3714285714)
            )
            path.addLine(to: CGPoint(x: 0,
                                     y: width * 0.5142857143))
            path.addLine(to: CGPoint(x: 0,
                                     y: width * 0.4285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.2857142857,
                            y: width * 0.2285714286),
                control: CGPoint(x: 0,
                                 y: width * 0.2285714286)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5,
                            y: width * 0.02857142857),
                control: CGPoint(x: width * 0.3571428571,
                                 y: width * 0.02857142857)
            )
        }
    }
}

struct BorderCarcase: View {
    
    let width: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5,
                                  y: width * 0.02857142857))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.8,
                            y: width * 0.2285714286),
                control: CGPoint(x: width * 0.8857142857,
                                 y: width * 0.02857142857)
            )
            path.addLine(to: CGPoint(x: width * 0.9142857143,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width,
                            y: width * 0.5142857143),
                control: CGPoint(x: width,
                                 y: width * 0.2285714286)
            )
            path.addLine(to: CGPoint(x: width * 0.9142857143,
                                     y: width * 0.5142857143))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.7857142857,
                            y: width * 0.3657142857),
                control: CGPoint(x: width * 0.9142857143,
                                 y: width * 0.3657142857)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.6571428571,
                            y: width * 0.5142857143),
                control: CGPoint(x: width * 0.6571428571,
                                 y: width * 0.3714285714)
            )
            path.addLine(to: CGPoint(x: width * 0.4,
                                     y: width * 0.5142857143))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.2714285714,
                            y: width * 0.3657142857),
                control: CGPoint(x: width * 0.4,
                                 y: width * 0.3657142857)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.1428571429,
                            y: width * 0.5142857143),
                control: CGPoint(x: width * 0.1428571429,
                                 y: width * 0.3714285714)
            )
            path.addLine(to: CGPoint(x: 0,
                                     y: width * 0.5142857143))
            path.addLine(to: CGPoint(x: 0,
                                     y: width * 0.4285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.2857142857,
                            y: width * 0.2285714286),
                control: CGPoint(x: 0,
                                 y: width * 0.2285714286)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5,
                            y: width * 0.02857142857),
                control: CGPoint(x: width * 0.3571428571,
                                 y: width * 0.02857142857)
            )
        }
        .strokedPath(StrokeStyle(lineWidth: 1))
        .foregroundColor(.black)
    }
}

struct FrontWindow: View {
    
    let width: CGFloat

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5714285714,
                                  y: width * 0.05714285714))
            path.addLine(to: CGPoint(x: width * 0.5714285714,
                                     y: width * 0.2285714286))
            
            path.addLine(to: CGPoint(x: width * 0.3428571429,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5142857143,
                            y: width * 0.05714285714),
                control: CGPoint(x: width * 0.3857142857,
                                 y: width * 0.06571428571)
            )
        }
        .foregroundColor(.white)
    }
}

struct BorderFrontWindow: View {
    
    let width: CGFloat

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5714285714,
                                  y: width * 0.05714285714))
            path.addLine(to: CGPoint(x: width * 0.5714285714,
                                     y: width * 0.2285714286))
            
            path.addLine(to: CGPoint(x: width * 0.3428571429,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5142857143,
                            y: width * 0.05714285714),
                control: CGPoint(x: width * 0.3857142857,
                                 y: width * 0.06571428571)
            )
            path.addLine(to: CGPoint(x: width * 0.5714285714,
                                    y: width * 0.05714285714))
        }
        .strokedPath(StrokeStyle(lineWidth: 1))
        .foregroundColor(.black)
    }
}

struct Door: View {
    
    let width: CGFloat
    @Binding var color: Color

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5942857143,
                                  y: width * 0.04285714286))
            path.addLine(to: CGPoint(x: width * 0.5942857143,
                                     y: width * 0.4857142857))
            path.addLine(to: CGPoint(x: width * 0.4228571429,
                                     y: width * 0.4857142857))
            path.addQuadCurve(to: CGPoint(x: width * 0.3142857143,
                                          y: width * 0.3428571429),
                              control: CGPoint(x: width * 0.4142857143,
                                               y: width * 0.3714285714))
            path.addLine(to: CGPoint(x: width * 0.3142857143,
                                     y: width * 0.2285714286))
            path.addQuadCurve(to: CGPoint(x: width * 0.5942857143,
                                          y: width * 0.04285714286),
                              control: CGPoint(x: width * 0.3714285714,
                                               y: width * 0.008571428571))
        }
        .strokedPath(StrokeStyle(lineWidth: 1))
        .foregroundColor(color == .black ? .gray : .black)
    }
}

struct DoorHandle: View {
    
    let width: CGFloat
    @Binding var color: Color

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.5714285714,
                                  y: width * 0.2714285714))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5142857143,
                            y: width * 0.2714285714),
                control: CGPoint(x: width * 0.5428571429,
                                 y: width * 0.2428571429)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5714285714,
                            y: width * 0.2714285714),
                control: CGPoint(x: width * 0.5428571429,
                                 y: width * 0.3)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.5142857143,
                            y: width * 0.2714285714),
                control: CGPoint(x: width * 0.5428571429,
                                 y: width * 0.2628571429)
            )
        }
        .strokedPath(StrokeStyle(lineWidth: 1))
        .foregroundColor(color == .black ? .gray : .black)
    }
}

struct RearWindow: View {
    
    let width: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.6285714286,
                                  y: width * 0.06285714286))
            path.addLine(to: CGPoint(x: width * 0.6285714286,
                                     y: width * 0.2285714286))
            
            path.addLine(to: CGPoint(x: width * 0.7571428571,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.6285714286,
                            y: width * 0.06285714286),
                control: CGPoint(x: width * 0.8285714286,
                                 y: width * 0.08571428571)
            )
        }
        .foregroundColor(.white)
    }
}

struct BorderRearWindow: View {
    
    let width: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.6285714286,
                                  y: width * 0.06285714286))
            path.addLine(to: CGPoint(x: width * 0.6285714286,
                                     y: width * 0.2285714286))
            
            path.addLine(to: CGPoint(x: width * 0.7571428571,
                                     y: width * 0.2285714286))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.6285714286,
                            y: width * 0.06285714286),
                control: CGPoint(x: width * 0.8285714286,
                                 y: width * 0.08571428571)
            )
        }
        .strokedPath(StrokeStyle(lineWidth: 1))
        .foregroundColor(.black)
    }
}

struct HeadLight: View {
    
    let width: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: width * 0.02857142857,
                                  y: width * 0.2857142857))
            path.addQuadCurve(
                to: CGPoint(x: width * 0.08571428571,
                            y: width * 0.3142857143),
                control: CGPoint(x: width * 0.08571428571,
                                 y: width * 0.2857142857)
            )
            path.addQuadCurve(
                to: CGPoint(x: width * 0.02857142857,
                            y: width * 0.3428571429),
                control: CGPoint(x: width * 0.08571428571,
                                 y: width * 0.3428571429)
            )
        }
        .foregroundColor(.gray)
    }
}
