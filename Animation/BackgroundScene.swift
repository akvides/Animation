//
//  BackgroundScene.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct BackgroundScene: View {
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color(red: 158/255, green: 203/255, blue: 1))
            ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(height: 80)
                HStack{
                    ForEach(0..<5) { iteration in
                        Mountain(height: 80)
                            .offset(x: CGFloat(iteration * Int.random(in: 10...100)),
                                    y: CGFloat(-60))
                        Spacer()
                    }
                }
                HStack{
                    ForEach(0..<100) { iteration in
                        Wood(height: 40)
                            .offset(x: CGFloat(iteration * Int.random(in: 0...5)), y: CGFloat(Int.random(in: -10...10)))
                    }
                }
            }
                .padding(-8)
            GeometryReader { _ in
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                    ForEach(0..<40) { iteration in
                        Path { path in
                            path.move(to: CGPoint(x: 11 + iteration * 75,  // +2
                                                  y: 36))
                            path.addLine(to: CGPoint(x: 64 + iteration * 75, // -2
                                                     y: 36))
                            path.addLine(to: CGPoint(x: 65 + iteration * 75,
                                                     y: 44))
                            path.addLine(to: CGPoint(x: 10 + iteration * 75,
                                                     y: 44))
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 80)
        }
    }
}

struct BackgroundScene_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundScene()
            .previewLayout(.fixed(width: 3000, height: 300))
    }
}
