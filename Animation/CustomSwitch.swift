//
//  CustomSwitch.swift
//  Animation
//
//  Created by Василий Полторак on 19.06.2022.
//

import SwiftUI

struct CustomSwitch: View {
    
    let size: CGFloat
    @Binding var isOn: Bool
    let onImage: SwitchImage = .sun
    let offImage: SwitchImage = .moon
    
    @State private var position: CGSize = CGSize.zero
    @State private var onPosition: CGSize = CGSize.zero
    @State private var offPosition: CGSize = CGSize.zero
    
    private var animate: Animation {
        .linear(duration: 0.2)
    }
    
    var body: some View {
        VStack{
            
            ZStack {
                GeometryReader { geometry in
                    
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let middleHeight = height/2
                    ZStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: size * 0.85, height: size)
                            Circle()
                                .frame(width: size, height: size)
                                .offset(x: width * 0.22)
                                .foregroundColor(.gray)
                            Circle()
                                .frame(width: size, height: size)
                                .offset(x: -width * 0.22)
                                .foregroundColor(.gray)
                        }
                        .onAppear {
                            position.width = width - width * 0.286
                            onPosition.width = width - width * 0.286
                            offPosition.width = width * 0.286
                        }
                        ZStack {
                            Rectangle()
                                .foregroundColor(isOn ? .green : Color(white: 0.91, opacity: 1))
                                .animation(animate, value: isOn)
                                .frame(width: size * 0.85, height: size * 0.99)
                            Circle()
                                .offset(x: width * 0.22)
                                .foregroundColor(isOn ? .green : Color(white: 0.91, opacity: 1))
                                .animation(animate, value: isOn)
                                .frame(width: size * 0.99, height: size * 0.99)
                            Circle()
                                .offset(x: -width * 0.22)
                                .foregroundColor(isOn ? .green : Color(white: 0.91, opacity: 1))
                                .animation(animate, value: isOn)
                                .frame(width: size * 0.99, height: size * 0.99)
                        }
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(color: Color(white: 0, opacity: 0.05),
                                        radius: 6,
                                        x: isOn ? -size * 0.04 : size * 0.04,
                                        y: 0)
                                .animation(animate, value: isOn)
                                .frame(width: height * 0.95, height:  height * 0.95)
                            Image(systemName: isOn ? onImage.rawValue : offImage.rawValue)
                                .resizable()
                                .foregroundColor(.gray)
                                .padding(size * 0.14)
                                .frame(width: height * 0.95, height:  height * 0.95)
                                .animation(animate, value: isOn)
                        }
                        .frame(width: height * 0.95, height:  height * 0.95)
                        .position(x: position.width, y: middleHeight)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    let currentPosition = value.location.x
                                    
                                    if currentPosition <= width - width * 0.286 && currentPosition >= width * 0.286 {
                                        position.width = value.location.x
                                    }
                                    
                                })
                                .onEnded({ value in
                                    
                                    let currentPosition = value.location.x
                                    let middlePosition = (width - width * 0.286) - (width * 0.286)
                                    if currentPosition >= middlePosition {
                                        isOn = true
                                    } else {
                                        isOn = false
                                    }
                                    
                                    if isOn {
                                        position.width = width - width * 0.286
                                    } else {
                                        position.width = width * 0.286
                                    }
                                })
                        )
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    isOn.toggle()
                                    
                                    if isOn {
                                        position.width = width - width * 0.286
                                    } else {
                                        position.width = width * 0.286
                                    }
                                })
                        )
                    }
                    .frame(width: size * 1.785, height: size)
                    
                }
                .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            isOn.toggle()
                            if isOn {
                                position = onPosition
                            } else {
                                position = offPosition
                            }
                        })
                )
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            isOn.toggle()
                            
                            if isOn {
                                position = onPosition
                            } else {
                                position = offPosition
                            }
                        })
                )
            }
            .frame(width: size * 1.785, height: size)
        }
    }
}

struct CustomSwitch_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwitch(size: 210, isOn: .constant(true))
    }
}


enum SwitchImage: String {
    case moon = "moon.fill"
    case sun = "sun.max.fill"
}
