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
            Spacer()
           TikTikGrid()
            Spacer()
            Text("Score: ")
            Text("Player X: \(TicTac.scorePlayer1)")
            Text("Player O: \(TicTac.scorePlayer2)")
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
