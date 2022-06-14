//
//  CarBody_Draft.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct CarBody_Draft: View {
    
    let width: CGFloat
    let height: CGFloat
    
    @State private var isCarWent: Bool = false
    
    var foreverAnimation: Animation {
        .easeInOut(duration: 1)
        .repeatForever()
    }
    
    var body: some View {
        VStack {
            GeometryReader {geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                
                ZStack{
                    ZStack{
                        Сarcase_Draft(width: width, height: height)
                        FrontWindow_Draft(width: width, height: height)
                        RearWindow_Draft(width: width, height: height)
                        HeadLight_Draft(width: width, height: height)
                    }
                    .offset(y: isCarWent ? -10 : 0)
                    .rotationEffect(.degrees(isCarWent ? 1 : 0))
                    .animation(isCarWent ? foreverAnimation : .default, value:  isCarWent)
                    Wheels(width: self.width, isRotating: $isCarWent, speed: .constant(.first))
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



struct CarBody_Draft_Previews: PreviewProvider {
    static var previews: some View {
        CarBody_Draft(width: 350, height: 210)
//            .frame(width: 350, height: 210)
    }
}

struct Сarcase_Draft: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 175, y: 10))
            path.addQuadCurve(
                to: CGPoint(x: 280, y: 80),
                control: CGPoint(x: 310, y: 10)
            )
            path.addLine(to: CGPoint(x: 320, y: 80))
            path.addQuadCurve(
                to: CGPoint(x: 350, y: 180),
                control: CGPoint(x: 350, y: 80)
            )
            path.addLine(to: CGPoint(x: 320, y: 180))
            path.addQuadCurve(
                to: CGPoint(x: 275, y: 128),
                control: CGPoint(x: 320, y: 128)
            )
            path.addQuadCurve(
                to: CGPoint(x: 230, y: 180),
                control: CGPoint(x: 230, y: 130)
            )
            path.addLine(to: CGPoint(x: 140, y: 180))
            path.addQuadCurve(
                to: CGPoint(x: 95, y: 128),
                control: CGPoint(x: 140, y: 128)
            )
            path.addQuadCurve(
                to: CGPoint(x: 50, y: 180),
                control: CGPoint(x: 50, y: 130)
            )
            path.addLine(to: CGPoint(x: 0, y: 180))
            path.addLine(to: CGPoint(x: 0, y: 150))
            path.addQuadCurve(
                to: CGPoint(x: 100, y: 80),
                control: CGPoint(x: 00, y: 80)
            )
            path.addQuadCurve(
                to: CGPoint(x: 175, y: 10),
                control: CGPoint(x: 125, y: 10)
            )
        }
    }
}

struct FrontWindow_Draft: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 80))
            
            path.addLine(to: CGPoint(x: 120, y: 80))
            path.addQuadCurve(
                to: CGPoint(x: 180, y: 20),
                control: CGPoint(x: 135, y: 23)
            )
        }
        .foregroundColor(.white)
    }
}

struct RearWindow_Draft: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 220, y: 22))
            path.addLine(to: CGPoint(x: 220, y: 80))
            
            path.addLine(to: CGPoint(x: 265, y: 80))
            path.addQuadCurve(
                to: CGPoint(x: 220, y: 22),
                control: CGPoint(x: 290, y: 30)
            )
        }
        .foregroundColor(.white)
    }
}

struct HeadLight_Draft: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 100))
            path.addQuadCurve(
                to: CGPoint(x: 30, y: 110),
                control: CGPoint(x: 30, y: 100)
            )
            path.addQuadCurve(
                to: CGPoint(x: 10, y: 120),
                control: CGPoint(x: 30, y: 120)
            )
        }
        .foregroundColor(.gray)
    }
}
