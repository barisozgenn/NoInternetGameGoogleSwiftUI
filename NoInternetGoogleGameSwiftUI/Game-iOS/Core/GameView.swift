//
//  GameView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI
import GameplayKit
struct GameView: View {
   
    @State private var groundPosX = 1600.0
   
    @State private var score = 0
   
    var body: some View {
        ZStack{
            CloudsView()
            ObstacleView()
            scoreLabel
            
            VStack {
                ground
               // DinoView()
            }
        
        }
        .onAppear{
            
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)){
                groundPosX = -1600
            }
        }
    }
}
extension GameView {
    private var ground: some View {
        ZStack{
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .background(Color(.darkGray))
                .offset(y: -3)
            
            Image("way")
                .resizable()
                .scaledToFit()
                .frame(width: 2900)
                .offset(x: groundPosX)
        }
        .offset(y: 114)
    }
    
    private var scoreLabel: some View {
        HStack{
            Text("hello 00000")
                .font(.custom("PressStart2P", size: 29))
        }
        .frame(maxWidth: 350, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
        .zIndex(1)
    }
    
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
