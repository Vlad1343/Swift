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
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", ".", "="]
    ]
    
    
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.ignoresSafeArea(edges: .all)
            
            VStack (spacing: 12) {
                HStack {
                    Spacer()
                    Text("42")
                        .foregroundStyle(.white)
                        .font(.system(size: 64))
                }.padding()

                
                ForEach(button, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Text(button)
                            .font(.system(size: 32))
                            .frame(width: buttonWidth(), height: self.buttonWidth())
                                .foregroundStyle(.white)
                                .background(Color.yellow)
                                .cornerRadius(40)

                        }
                        
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth() -> CGFloat {
        80
    }
    
    
}


#Preview {
    ContentView()
}
