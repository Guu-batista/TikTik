//
//  TikTikGrid.swift
//  TikTik
//
//  Created by Gustavo Batista on 18/04/24.
//

import SwiftUI

struct TikTikGrid: View {
    @ObservedObject var TicTac = tiktikModel()
    let col = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
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
            .padding()
        })
        .padding(.bottom)
    }
}

#Preview {
    TikTikGrid()
}
