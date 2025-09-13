//
//  ContentView.swift
//  Calculator
//
//  Created by Vladyslav Shutkevych on 13/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    let button = [
        ["7", "8", "9", "X"], // 2D Array
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
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { button in // loop
                            Text(button)
                            .font(.system(size: 32))
                            .frame(width: buttonWidth(), height: self.buttonWidth())
                                .foregroundStyle(.white)
                                .background(Color.yellow)
                                .cornerRadius(self.buttonWidth())

                        }
                        
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5*12) / 4 // give some space for 4 buttons per row, 5 spaces between buttons, 12 - spacing in HStack
    }
    
    
}


#Preview {
    ContentView()
}
