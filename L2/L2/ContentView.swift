//
//  ContentView.swift
//  L2
//
//  Created by Vladyslav Shutkevych on 11/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack{
            Color(.mint)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0) {
                Image("niagarafalls")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack {
                    
                    Text("Niagara Falls")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer() //spacing
                    
                    VStack{
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                        }
                        Text("Reviews: 361")

                    }
                    .foregroundStyle(.orange)
                    .font(.caption)
                        
                        
                }
                
                Text("Come visit the falls for an experience of lifetime!")
                HStack{
                    Spacer()
                    Image(systemName: "binoculars.fill")
                    Image(systemName: "map.fill")
                    Image(systemName: "fork.knife")
                }
                .foregroundStyle(.gray)
                .font(.caption)
            }
            .padding()
            .background(Rectangle()
                .foregroundStyle(.white))
                .cornerRadius(20)
                .shadow(radius: 10)
            .padding()
        }
        

       
            
        
        
    }
}

#Preview {
    ContentView()
}
