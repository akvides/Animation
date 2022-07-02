//
//  Mountain.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct Mountain: View {
    
    let height: CGFloat
    
    private var width: CGFloat {
        height * 1.5
    }
    
    var body: some View {
        GeometryReader { _ in
    
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0,
                                          y: height))
                    path.addLine(to: CGPoint(x: width * 0.32,
                                             y: height * 0.2))
                    path.addLine(to: CGPoint(x: width * 0.56,
                                             y: height * 0.64))
                    path.addLine(to: CGPoint(x: width * 0.7466666667,
                                             y: 0))
                    path.addLine(to: CGPoint(x: width,
                                             y: height))
                }
                .foregroundColor(.gray)
                Path { path in
                    path.move(to: CGPoint(x: width * 0.256,
                                          y: height * 0.36))
                    path.addLine(to: CGPoint(x: width * 0.32,
                                             y: height * 0.2))
                    path.addLine(to: CGPoint(x: width * 0.408,
                                             y: height * 0.36))
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.3573333333,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.384,
                                         y: height * 0.38)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.3066666667,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.3333333333,
                                         y: height * 0.38)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.256,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.2826666667,
                                         y: height * 0.38)
                    )
                }
                .foregroundColor(.white)
                Path { path in
                    path.move(to: CGPoint(x: width * 0.6426666667,
                                          y: height * 0.36))
                    path.addLine(to: CGPoint(x: width * 0.7466666667,
                                             y: 0))
                    path.addLine(to: CGPoint(x: width * 0.8373333333,
                                             y: height * 0.36))
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.7893333333,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.8213333333,
                                         y: height * 0.38)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.7226666667,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.7546666667,
                                         y: height * 0.38)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.6426666667,
                                    y: height * 0.36),
                        control: CGPoint(x: width * 0.6853333333,
                                         y: height * 0.38)
                    )
                }
                .foregroundColor(.white)
            }
        }
        .frame(width: width, height: height)
        
    }
}

struct Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Mountain(height: 250)
            .background(Color(.blue))
    }
}
