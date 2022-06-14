//
//  CarBody.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct CarBody: View {
    
    let width: CGFloat
    var height: CGFloat {
        width * 0.6
    }
    
    @State private var isCarWent: Bool = false
    
    var foreverAnimation: Animation {
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
                        FrontWindow(width: width)
                        RearWindow(width: width)
                        HeadLight(width: width)
                    }
                    .offset(y: isCarWent ? -10 : 0)
                    .rotationEffect(.degrees(isCarWent ? 1 : 0))
                    .animation(isCarWent ? foreverAnimation : .default, value:  isCarWent)
                    Wheels(width: self.width, isRotating: $isCarWent)
                }
            }
            Spacer()
            Button(action: tap ) {
                Text(isCarWent ? "Стоп анимация" : "Запуск Анимаци")
            }
            .offset(y: 100)
        }
        .frame(width: width, height: height)
        
    }
    
    func tap() {
        withAnimation {
            isCarWent.toggle()
        }
    }
}



struct CarBody_Previews: PreviewProvider {
    static var previews: some View {
        CarBody(width: 350)
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

struct RearWindow: View {
    
    let width: CGFloat
//    let height: CGFloat
    
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
