//
//  ContentView.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDay = true
    @State private var startAnimation = false
    @State private var carColor: Color = .black
    let startPosition = -(UIScreen.main.bounds.width / 2 + (UIScreen.main.bounds.width * 2))
    @State private var range: CGFloat = -(UIScreen.main.bounds.width / 2 + (UIScreen.main.bounds.width * 2))
    
    let widthScreen = UIScreen.main.bounds.width
    let daySkyColor = Color(red: 158/255, green: 203/255, blue: 1)
    let nightSkyColor = Color(red: 12/255, green: 36/255, blue: 74/255)
    
    let arrayMountainsForScene = ForestScene.shared.getArrayMountainsForScene()
    let arrayPositionsMountainsForScene = ForestScene.shared.getArrayPositionsMountainsForScene()
    let arrayTreesForScene = ForestScene.shared.getArrayTreesForScene()
    let arrayPositionsTreesForScene = ForestScene.getArrayPositionsTreesForScene()
    let arrayPositionsStarsForScene = ForestScene.getArrayPositionsStarsForScene()
    
    private var changeTimeOfDay: Animation {
        .linear(duration: 1.0)
        .delay(isDay ? 0 : 2)
    }
    
    private var moonAnimation: Animation {
        .linear(duration: 3)
        .delay(isDay ? 0 : 3)
        
    }
    
    private var sunAnimation: Animation {
        .linear(duration: 3)
        .delay(isDay ? 2 : 0)
        
    }
    private var slideBackground: Animation {
        .linear(duration: 0)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        let timer = Timer.publish(every: 0.005, on: .main, in: .common).autoconnect()
        
        VStack{
            VStack{
                CarBody(width: 90, isCarWent: $startAnimation, color: $carColor)
            }
            .frame(height: 300)
            .offset(x: 0, y: 70)
            .background() {
                ZStack {
                    Rectangle()
                    .foregroundColor(isDay ? daySkyColor : nightSkyColor)
                    .animation(changeTimeOfDay, value: isDay)
                    .frame(width: UIScreen.main.bounds.width)
                    ForEach(0..<80){ i in
                        Star(isDay: $isDay, size: 7)
                            .offset(arrayPositionsStarsForScene[i])
                        
                    }
                    Image(systemName: "moon.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .offset(x: -widthScreen / 2 + 50, y: isDay ? 30 : -100)
                        .animation(moonAnimation, value: isDay)
                        .shadow(color: .white, radius: 15, x: 0, y: 0)
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 80)
                        .offset(x: widthScreen / 2 - 60,
                                y: isDay ? -100 : 50)
                        .animation(sunAnimation, value: isDay)
                        .shadow(color: .white, radius: 15, x: 0, y: 0)
                    HStack {
                        FirstAndLastBackgroundScene(isDay: $isDay)
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.horizontal, -4)
                        ForEach(0..<4) { iteration in

                            BackgroundSceneV2(
                                isDay: $isDay,
                                countMountains: arrayMountainsForScene[iteration],
                                positionMountains: arrayPositionsMountainsForScene[iteration],
                                countTrees: arrayTreesForScene[iteration],
                                positionTrees: arrayPositionsTreesForScene[iteration]
                            )
                                .frame(width: UIScreen.main.bounds.width)
                                .padding(.horizontal, -4)
                        }
                        FirstAndLastBackgroundScene(isDay: $isDay)
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.horizontal, -4)
                    }
                    .offset(x: range)
                        .animation(startAnimation ? slideBackground : .default, value: startAnimation)
                        .onReceive(timer) { _ in
                            self.range += self.startAnimation ? 1 : 0
                            if self.range == -startPosition {
                                self.range = startPosition
                            }
                        }
                    
                }
                .frame(height: 300)
                
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
            CustomSwitch(size: 50, isOn: $isDay)
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
                .overlay(Circle().stroke(borderColor, lineWidth: 1))
        }
    }
}
