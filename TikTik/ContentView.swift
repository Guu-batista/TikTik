//
//  ContentView.swift
//  TikTik
//
//  Created by Gustavo Batista on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var TicTac = tiktikModel()
    var body: some View {
        VStack{
            Text("TIK TIK")
                .font(.system(size: 45, weight: .heavy))
            
            let col = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: col, content: {
                ForEach(0..<9){ i in
                    Button(action: {
                        //action
                        TicTac.buttonTapped(i: i)
                    }, label: {
                        Text(TicTac.buttonLabel(i: i))
                            .frame(width: 100, height: 100)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .font(.system(size: 45, weight: .heavy))
                    })
                }
            })
            .padding(.bottom)
            
            Button(action: {
                TicTac.resetGame()
            }, label: {
                Text("Reset")
            })
            .frame(width: 200, height: 50)
            .background(.blue)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .heavy))
            .clipShape(.capsule)
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
