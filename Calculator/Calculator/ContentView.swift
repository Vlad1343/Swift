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
    case decimal
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
        case .multiply: return "×"
        case .divide: return "÷"
        case .ac: return "AC"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .decimal: return "."
            //        default:
            //            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default :
            return (Color.orange)
        }
    }
    
}

// Define env object. Treat it as a global application state

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    
    private var currentNumber: Double = 0
    private var previousNumber: Double?
    private var currentOperation: CalculatorButton?
    private var isTypingNumber = false
    
    func receiveInput(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            handleNumberInput(calculatorButton)
        case .plus, .minus, .multiply, .divide:
            handleOperationInput(calculatorButton)
        case .equals:
            handleEquals()
        case .ac:
            clear()
        case .plusMinus:
            toggleSign()
        case .percent:
            applyPercent()
        }
    }
    
    private func handleNumberInput(_ button: CalculatorButton) {
        let value = button.title
        
        if isTypingNumber {
            if value == "." && display.contains(".") { return } // prevent multiple decimals
            display += value
        } else {
            display = value == "." ? "0." : value
            isTypingNumber = true
        }
        
        currentNumber = Double(display) ?? 0
    }
    
    private func handleOperationInput(_ operation: CalculatorButton) {
        previousNumber = currentNumber
        currentOperation = operation
        isTypingNumber = false
    }
    
    private func handleEquals() {
        guard let operation = currentOperation, //safely unwrap optionals (like Double?) and make sure they are not nil before using them.
              let previous = previousNumber else { return }
        
        var result: Double = previous
        
        switch operation {
        case .plus:
            result += currentNumber
        case .minus:
            result -= currentNumber
        case .multiply:
            result *= currentNumber
        case .divide:
            result = currentNumber == 0 ? 0 : result / currentNumber
            if currentNumber == 0 {
                display = "Undefined"
                return
            }
        default:
            break
        }
        
        display = formatResult(result)
        currentNumber = result
        previousNumber = nil
        currentOperation = nil
        isTypingNumber = false
    }
    
    private func clear() {
        display = "0"
        currentNumber = 0
        previousNumber = nil
        currentOperation = nil
        isTypingNumber = false
    }
    
    private func toggleSign() {
        currentNumber = -currentNumber
        display = formatResult(currentNumber)
    }
    
    private func applyPercent() {
        currentNumber = currentNumber / 100
        display = formatResult(currentNumber)
    }
    
    private func formatResult(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value)) // remove ".0"
        } else {
            return String(value)
        }
    }
}



struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
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
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
        
        
        
    ]
    
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.ignoresSafeArea(edges: .all)
            
            VStack (spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.display)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.white)
                        .font(.system(size: 64))
                }.padding()
                
                
                ForEach(button, id: \.self) { row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { button in // loop
                            CalculatorView(button: button)
                                
                            
                        
                            
                            
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    

    
    
}


struct CalculatorView: View {
    
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: button)}){
                Text(button.title)
                    .font(.system(size: 32))
                    .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5*12) / 4)
                    .foregroundStyle(.white)
                    .background(button.backgroundColor)
                    .cornerRadius(self.buttonWidth(button: button))
            }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat { //function returns a number representing a width (in points) that SwiftUI will use to size your button
        if button == .zero {
            return ((UIScreen.main.bounds.width - 4*12) / 4) * 2
        }
        return (UIScreen.main.bounds.width - 5*12) / 4 // give some space for 4 buttons per row, 5 spaces between buttons, 12 - spacing in HStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
