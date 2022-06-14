//
//  ContentView.swift
//  Animation
//
//  Created by Василий Полторак on 10.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CarBody(width: 150)
//        HStack{
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//            Wood(height: 50)
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1000, height: 500))
    }
}
