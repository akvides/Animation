//
//  Tree.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct Tree: View {
    
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            
            let woodColor = Color(red: 85/255, green: 149/255, blue: 78/255)
            let barrelColor = Color(red: 131/255, green: 82/255, blue: 43/255)
            
            let middle = geometry.size.width / 2
        
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: 0))
                    path.addLine(to: CGPoint(x: middle + height * 0.1666666667,
                                             y: height * 0.1666666667))
                    path.addLine(to: CGPoint(x: middle - height * 0.1666666667,
                                             y: height * 0.1666666667))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: height * 0.1))
                    path.addLine(to: CGPoint(x: middle + height * 0.2,
                                             y: height * 0.3333333333))
                    path.addLine(to: CGPoint(x: middle - height * 0.2,
                                             y: height * 0.3333333333))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: height * 0.2666666667))
                    path.addLine(to: CGPoint(x: middle + height * 0.2333333333,
                                             y: height * 0.5333333333))
                    path.addLine(to: CGPoint(x: middle - height * 0.2333333333,
                                             y: height * 0.5333333333))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle,
                                          y: height * 0.4666666667))
                    path.addLine(to: CGPoint(x: middle + height * 0.2666666667,
                                             y: height * 0.7333333333))
                    path.addLine(to: CGPoint(x: middle - height * 0.2666666667,
                                             y: height * 0.7333333333))
                }
                .foregroundColor(woodColor)
                Path { path in
                    path.move(to: CGPoint(x: middle + height * 0.06666666667,
                                          y: height * 0.7333333333))
                    path.addLine(to: CGPoint(x: middle + height * 0.06666666667,
                                             y: height))
                    path.addLine(to: CGPoint(x: middle - height * 0.06666666667,
                                             y: height))
                    path.addLine(to: CGPoint(x: middle - height * 0.06666666667,
                                             y: height * 0.7333333333))
                }
                .foregroundColor(barrelColor)
                
            }
        }
        .frame(height: height)
    }
}

struct Wood_Previews: PreviewProvider {
    static var previews: some View {
        Tree(height: 300)
    }
}
