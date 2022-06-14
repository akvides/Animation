//
//  Wood_Draft.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct Wood_Draft: View {
    let height: CGFloat
    var body: some View {
        GeometryReader { geometry in
            
            let woodColor = Color(red: 85/255, green: 149/255, blue: 78/255)
            let barrelColor = Color(red: 131/255, green: 82/255, blue: 43/255)
            let width = geometry.size.width
            
            let middle = width / 2
        
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 0))
                    path.addLine(to: CGPoint(x: middle + 50,
                                             y: 50))
                    path.addLine(to: CGPoint(x: middle - 50,
                                             y: 50))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 30))
                    path.addLine(to: CGPoint(x: middle + 60,
                                             y: 100))
                    path.addLine(to: CGPoint(x: middle - 60,
                                             y: 100))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 80))
                    path.addLine(to: CGPoint(x: middle + 70,
                                             y: 160))
                    path.addLine(to: CGPoint(x: middle - 70,
                                             y: 160))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 140))
                    path.addLine(to: CGPoint(x: middle + 80,
                                             y: 220))
                    path.addLine(to: CGPoint(x: middle - 80,
                                             y: 220))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle + 20,
                                          y: 220))
                    path.addLine(to: CGPoint(x: middle + 20,
                                             y: 300))
                    path.addLine(to: CGPoint(x: middle - 20,
                                             y: 300))
                    path.addLine(to: CGPoint(x: middle - 20,
                                             y: 220))
                }
                .foregroundColor(barrelColor)
                
            }
        }
        .frame(height: height)
    }
}

struct Wood_Draft_Previews: PreviewProvider {
    static var previews: some View {
        Wood_Draft(height: 300)
    }
}
