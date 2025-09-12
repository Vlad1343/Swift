//
//  ContentView.swift
//  War Card App
//
//  Created by Vladyslav Shutkevych on 12/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                    
                        
                }
                Spacer()
                Image("button")
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("Bot")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text("0")
                            .font(.largeTitle)

                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
                
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
