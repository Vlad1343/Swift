//
//  ContentView.swift
//  Calculator
//
//  Created by Vladyslav Shutkevych on 13/09/2025.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "/"
        case .ac: return "AC"
        case .plusMinus: return "±"
        case .percent: return "%"
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default :
            return (Color.orange)
        }
    }
    
}

struct ContentView: View {
    
//    let button = [
//        ["7", "8", "9", "X"], // 2D Array
//        ["4", "5", "6", "-"],
//        ["1", "2", "3", "+"],
//        ["0", ".", ".", "="]
//    ]
    let button: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus]
  
  

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
                            Text(button.title)
                            .font(.system(size: 32))
                            .frame(width: buttonWidth(), height: self.buttonWidth())
                                .foregroundStyle(.white)
                                .background(button.backgroundColor)
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
