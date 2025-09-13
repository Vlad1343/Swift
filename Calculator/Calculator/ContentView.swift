//
//  ContentView.swift
//  Calculator
//
//  Created by Vladyslav Shutkevych on 13/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    let button = [
        ["7", "8", "9", "X"],
        ["7", "8", "9", "X"],
        ["1", "2", "3", "X"],
        ["0", ".", ".", "X"]
    ]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(["7", "8", "9", "X"], id: \.self) { button in Text(button)
                        .font(.system(size: 32))
                        .frame(width: 80, height: 80)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
