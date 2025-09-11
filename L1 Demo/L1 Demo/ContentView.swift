//
//  ContentView.swift
//  L1 Demo
//
//  Created by Vladyslav Shutkevych on 11/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.lightGray).ignoresSafeArea()
            
            VStack {
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                
                // Outlined Text
                Text("Niagara Falls")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black) // Fill color
                    .overlay(
                        Text("Niagara Falls")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white) // Outline color
                            .offset(x: 1, y: 1)
                    )
            }
        }
    }
}

struct ContentViewPreviews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
