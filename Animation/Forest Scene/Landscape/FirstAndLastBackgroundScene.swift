//
//  FirstAndLastBackgroundScene.swift
//  Animation
//
//  Created by Василий Полторак on 18.06.2022.
//

import SwiftUI

struct FirstAndLastBackgroundScene: View {
    
    @Binding var isDay: Bool
    
    private var changeTimeOfDay: Animation {
        .linear(duration: 1.0)
    }
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        let dayGrassColor = Color(red: 88/255, green: 186/255, blue: 88/255)
        let nightGrassColor = Color(red: 52/255, green: 128/255, blue: 64/255)
        
        VStack{
            ZStack {
                Spacer()
            }
            ZStack {
                Rectangle()
                    .foregroundColor(isDay ? dayGrassColor : nightGrassColor)
                    .animation(changeTimeOfDay, value: isDay)
                Mountain(height: 80)
                    .offset(x: 70,
                            y: -60)
                    .frame(width: width, alignment: .leading)
                FirstTreesForBackgroundScene()
                SecondTreesForBackgroundScene()
                ThirdTreesForBackgroundScene()
                
                    
                    
            }
            .frame(width: UIScreen.main.bounds.width, height: 80)
            .padding(.vertical, -8)
            
            GeometryReader { geometry in
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                    ForEach(0..<4) { iteration in
                        Path { path in
                            path.move(to: CGPoint(x: width * 0.03666666667 + CGFloat(iteration) * (width * 0.25),
                                                  y: 36))
                            path.addLine(to: CGPoint(x: width * 0.2133333333 + CGFloat(iteration) * (width * 0.25),
                                                     y: 36))
                            path.addLine(to: CGPoint(x: width * 0.2166666667 + CGFloat(iteration) * (width * 0.25),
                                                     y: 44))
                            path.addLine(to: CGPoint(x: width * 0.03333333333 + CGFloat(iteration) * (width * 0.25),
                                                     y: 44))
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 80)
        }
        .frame(height: 300)
        
    }
}

struct FirstAndLastBackgroundScene_Previews: PreviewProvider {
    static var previews: some View {
        FirstAndLastBackgroundScene(isDay: .constant(false))
    }
}

struct FirstTreesForBackgroundScene: View {
    var body: some View {
        ZStack {
            Tree(height: 40)
                .offset(x:-25 , y: 3)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:21 , y: -35)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-121 , y: 12)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-71 , y: -11)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-31 , y: -34)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-159 , y: -10)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-74 , y: 9)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-170 , y: 2)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-7 , y: -31)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:82 , y: 5)
                .frame(width: 30)
            
        }
    }
}

struct SecondTreesForBackgroundScene: View {
    var body: some View {
        ZStack {
            Tree(height: 40)
                .offset(x:-73 , y: 17)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:0 , y: 0)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-57 , y: 4)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-12 , y: -27)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:50 , y: -1)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:166 , y: -6)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-93 , y: -2)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:77 , y: -1)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:172 , y: -20)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:53 , y: -16)
                .frame(width: 30)
        }
    }
}

struct ThirdTreesForBackgroundScene: View {
    var body: some View {
        ZStack {
            Tree(height: 40)
                .offset(x:136 , y: -7)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-128 , y: -34)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:48 , y: 3)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-130 , y: 7)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-24 , y: -8)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:129 , y: -14)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:-79 , y: 6)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:113 , y: -5)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:121 , y: 0)
                .frame(width: 30)
            Tree(height: 40)
                .offset(x:123 , y: -3)
                .frame(width: 30)
        }
    }
}
