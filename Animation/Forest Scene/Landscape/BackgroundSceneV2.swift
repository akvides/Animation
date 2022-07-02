//
//  BackgroundSceneV2.swift
//  Animation
//
//  Created by Василий Полторак on 18.06.2022.
//

import SwiftUI

struct BackgroundSceneV2: View {
    
    @Binding var isDay: Bool
    
    let countMountains: Int
    let positionMountains: CGSize
    
    let countTrees: Int
    let positionTrees: [CGSize]
    
    private var changeTimeOfDay: Animation {
        .linear(duration: 1.0)
    }

    
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        let dayGrassColor = Color(red: 88/255, green: 186/255, blue: 88/255)
        let nightGrassColor = Color(red: 52/255, green: 128/255, blue: 64/255)
        
        VStack{
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(isDay ? dayGrassColor : nightGrassColor)
                    .animation(changeTimeOfDay, value: isDay)
                ForEach(0..<countMountains, id: \.self) { _ in
                    Mountain(height: 80)
                        .offset(positionMountains)
                        .frame(width: width, alignment: .leading)
                    Spacer()
                }
                ForEach(0..<countTrees, id: \.self) { iteration in
                    Tree(height: 40)
                        .offset(positionTrees[iteration])
                        .frame(width: 30)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 80)
            .padding(.vertical, -8)
            
            GeometryReader { _ in
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

struct BackgoundSceneV2_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSceneV2(
            isDay: .constant(true),
            countMountains: 1,
            positionMountains: CGSize(width: 30, height: -60),
            countTrees: 3,
            positionTrees: [CGSize(width: -125, height: 3),
                            CGSize(width: -74, height: 9),
                            CGSize(width: 82, height: 5)]
        )
    }
}
