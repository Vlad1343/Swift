//
//  ContentView.swift
//  War Card App
//
//  Created by Vladyslav Shutkevych on 12/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card7" // property wrapper
    @State var computerCard = "card13"
    
    var playerScore: Int = 0
    var computerScore: Int = 0
    
    
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
                    Image(playerCard)
                    Spacer()
                    Image(computerCard)
                    Spacer()
                    
                        
                }
                Spacer()
                
                .foregroundStyle(.white)
                Button { // button using img
                    dealCards()
                } label: {
                    Image("button")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        // Text("0")
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("Computer")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(computerScore))
                            .font(.largeTitle)

                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
                
        }
        
        
        
    }
    
    func dealCards(){
        // Randomize the player's cards
        playerCard = "card" + String(Int.random(in: 2...14))
        // Randomize the computer's card
        computerCard = "card" + String(Int.random(in: 2...14))
        // Update the screen
        
    }
    
    
}



#Preview {
    ContentView()
}
