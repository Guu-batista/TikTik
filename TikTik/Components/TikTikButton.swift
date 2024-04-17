//
//  TikTikButton.swift
//  TikTik
//
//  Created by Gustavo Batista on 17/04/24.
//

import SwiftUI

struct TikTikButton: View {
    @ObservedObject var TicTac = tiktikModel()
    var body: some View {
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
}

#Preview {
    TikTikButton()
}
