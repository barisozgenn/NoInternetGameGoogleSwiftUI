//
//  GroundView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 26.01.2023.
//

import SwiftUI

struct GroundView: View {
    @State private var groundPosX = 900.0
    @Binding var dinoState : DinoStateModel
    
    var body: some View {
        if dinoState != .gameOver {
            HStack{
                Image("way")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 2900)
                    .offset(x: groundPosX)
            }
            .frame(width: 429)
            .clipped()
            .onAppear{
                withAnimation(.linear(duration: 12.9).repeatForever(autoreverses: false)){
                    if dinoState != .gameOver { groundPosX = -900 }
                }
            }
        }else {
            HStack{
                Image("way")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 2900)
                    .offset(x: dinoState != .gameOver ? groundPosX : 29)
            }
            .frame(width: 429)
            .clipped()
        }
    }
}

struct GroundView_Previews: PreviewProvider {
    static var previews: some View {
        GroundView(dinoState: .constant(.walk))
    }
}
