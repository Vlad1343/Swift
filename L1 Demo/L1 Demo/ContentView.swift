//
//  ContentView.swift
//  L1 Demo
//
//  Created by Vladyslav Shutkevych on 11/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {.resizable()
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        
        Image("niagarafalls")
            .resizable()
            .cornerRadius(10)
            .aspectRatio(contentMode: .fit)
        
        
        
    }
}

struct ContentViewPreviews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
