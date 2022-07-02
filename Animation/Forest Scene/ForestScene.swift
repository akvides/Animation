//
//  ForestScene.swift
//  Animation
//
//  Created by Василий Полторак on 18.06.2022.
//

import SwiftUI

class ForestScene {
    
    static let shared = ForestScene.self
     
    private let widthScreen = UIScreen.main.bounds.width
    
    private init(){}
    
    static func getArrayMountainsForScene() -> [Int] {
        var array = [Int]()
        for _ in 0..<4 {
            array.append(Int.random(in: 0...1))
        }
        return array
    }
    
    static func getArrayPositionsMountainsForScene() -> [CGSize] {
        var array = [CGSize]()
        for _ in 0..<4 {
            let coordinate = CGSize(width: CGFloat.random(in: 10...(UIScreen.main.bounds.width - (80 * 1.5) - 10)),
                                    height: -60)
            array.append(coordinate)
        }
        return array
    }
    
    
    static func getArrayTreesForScene() -> [Int] {
        var array = [Int]()
        for _ in 0..<4 {
            array.append(30)
        }
        return array
    }
    
    static func getArrayPositionsTreesForScene() -> [[CGSize]] {
        var array = [[CGSize]]()
        for _ in 0..<4 {
            var singleArray = [CGSize]()

            for _ in 0..<31 {
                let coordinate = CGSize(width: CGFloat.random(in: -(UIScreen.main.bounds.width / 2 - 15)...(UIScreen.main.bounds.width / 2 - 15)),
                                        height: CGFloat(Int.random(in: -36...18)))
                singleArray.append(coordinate)
            }
            array.append(singleArray)
        }
        return array
    }
    
    static func getArrayPositionsStarsForScene() -> [CGSize] {
        var array = [CGSize]()
        for _ in 0..<80 {
            let coordinate = CGSize(width: CGFloat.random(in: -(UIScreen.main.bounds.width / 2 + 15)...(UIScreen.main.bounds.width / 2 + 15)),
                                    height: CGFloat(Int.random(in: -143...(-18))))
            array.append(coordinate)
            
        }
        return array
    }
}
