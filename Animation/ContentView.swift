//
//  ContentView.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startAnimation = false
    @State private var carColor: Color = .black
    @State private var activeSpeed: Speed = .first
    @State private var speed: Double = 0.005
    @State private var range: CGFloat = 150
    
    private var slideBackground: Animation {
        .linear(duration: 0)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        let timer = Timer.publish(every: speed / activeSpeed.rawValue, on: .main, in: .common).autoconnect()
        VStack{
            VStack{
                CarBody(width: 90, isCarWent: $startAnimation, color: $carColor, speed: $activeSpeed)
            }
            .frame(height: 300)
            .offset(x: 0, y: 70)
            .background(alignment: .trailing) {
                BackgroundScene()
                    .frame(width: 3000, height: 300)
                    .offset(x: range)
                    .animation(startAnimation ? slideBackground : .default, value: startAnimation)
                    .onReceive(timer) { _ in
                        self.range += self.startAnimation ? 1 : 0
                        self.range = self.range.truncatingRemainder(dividingBy: 2760)
                        if self.range == 0 {
                            self.range = 150
                        }
                    }
            }
            Text("Цвет машины")
                .font(.title2)
            HStack{
                Spacer()
                ColorButton(carColor: $carColor, color: .cyan)
                ColorButton(carColor: $carColor, color: .yellow)
                ColorButton(carColor: $carColor, color: .blue)
                ColorButton(carColor: $carColor, color: .red)
                ColorButton(carColor: $carColor, color: .black)
                ColorButton(carColor: $carColor, color: .green)
                
                Spacer()
            }
            Text("Скорость")
                .font(.title2)
            HStack{
                Spacer()
                SpeedButton(speed: .first, speedAnimation: $activeSpeed)
                Spacer()
                SpeedButton(speed: .second, speedAnimation: $activeSpeed)
                Spacer()
                SpeedButton(speed: .third, speedAnimation: $activeSpeed)
                Spacer()
            }
            Spacer()
            Button(action: {startAnimation.toggle()}) {
                Text(startAnimation ? "Стоп" : "Поехали")
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .padding(.horizontal, 40)
                    .background(Color(.red))
                    .cornerRadius(20)
            }
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorButton: View {
    @Binding var carColor: Color
    let color: Color
    private var borderColor: Color {
        if color == .black {
            return .gray
        }
        return .black
    }
    var body: some View {
        Button(action: {carColor = color}) {
            Circle()
                .foregroundColor(color)
                .overlay(Circle().stroke(borderColor, lineWidth: 4))
        }
    }
}

struct SpeedButton: View {
    let speed: Speed
    @Binding var speedAnimation: Speed
    private var size: (CGFloat) {
        if speedAnimation == speed {
            return 50
        }
            return 35
        
    }
    var body: some View {
        Button(action: {speedAnimation = speed}) {
            Text("\(Int(speed.rawValue))")
                .frame(width: size, height: size)
                .font(.title2)
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
        }
    }
}

enum Speed: Double {
    case first = 1
    case second = 2
    case third = 3
}
