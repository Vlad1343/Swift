//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Vladyslav Shutkevych on 13/09/2025.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject var env = GlobalEnvironment()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(env) // ✅ injects it into the environment
        }
    }
}
