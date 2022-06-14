//
//  Mountain_Draft.swift
//  Animation
//
//  Created by Василий Полторак on 14.06.2022.
//

import SwiftUI

struct Mountain_Draft: View {
    let height: CGFloat
    var width: CGFloat {
        height * 1.5
    }
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0,
                                          y: height))
                    path.addLine(to: CGPoint(x: 120,
                                             y: 50))
                    path.addLine(to: CGPoint(x: 210,
                                             y: 160))
                    path.addLine(to: CGPoint(x: 280,
                                             y: 0))
                    path.addLine(to: CGPoint(x: width,
                                             y: height))
                }
                .foregroundColor(.gray)
                Path { path in
                    path.move(to: CGPoint(x: 96,
                                          y: 90))
                    path.addLine(to: CGPoint(x: 120,
                                             y: 50))
                    path.addLine(to: CGPoint(x: 153,
                                             y: 90))
                    path.addQuadCurve(
                        to: CGPoint(x: 134,
                                    y: 90),
                        control: CGPoint(x: 144,
                                         y: 95)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: 115,
                                    y: 90),
                        control: CGPoint(x: 125,
                                         y: 95)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: 96,
                                    y: 90),
                        control: CGPoint(x: 106,
                                         y: 95)
                    )
                }
                .foregroundColor(.white)
                Path { path in
                    path.move(to: CGPoint(x: 241,
                                          y: 90))
                    path.addLine(to: CGPoint(x: 280,
                                             y: 0))
                    path.addLine(to: CGPoint(x: 314,
                                             y: 90))
                    path.addQuadCurve(
                        to: CGPoint(x: 296,
                                    y: 90),
                        control: CGPoint(x: 308,
                                         y: 95)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: 271,
                                    y: 90),
                        control: CGPoint(x: 283,
                                         y: 95)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: 241,
                                    y: 90),
                        control: CGPoint(x: 257,
                                         y: 95)
                    )
                }
                .foregroundColor(.white)
                
                
            }
        }
        .frame(width: width, height: height)
    }
}

struct Mountain_Draft_Previews: PreviewProvider {
    static var previews: some View {
        Mountain_Draft(height: 250)
            .background(Color(.blue))
    }
}
