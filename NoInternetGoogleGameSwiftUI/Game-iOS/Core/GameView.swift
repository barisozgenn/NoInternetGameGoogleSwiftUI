//
//  GameView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI
import GameplayKit
struct GameView: View {
   
    @State private var cloudsPosX = [258.0, 329.0]
    @State private var groundPosX = 1600.0
    @State private var obstaclesPosX = [1000.0, 1350.0, 1700.0, 2050.0]
    private let obstaclesPosXMax = [-2200.0, -1850.0, -1500.0, -1150]
    @State private var score = 0
   
    var body: some View {
        ZStack{
            clouds
            obtacles
            scoreLabel
            
            VStack {
                ground
                DinoView()
            }
        
        }
        .onAppear{
            
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)){
                groundPosX = -1600
                obstaclesPosX[0] = obstaclesPosXMax[0]
                obstaclesPosX[1] = obstaclesPosXMax[1]
                obstaclesPosX[2] = obstaclesPosXMax[2]
                obstaclesPosX[3] = obstaclesPosXMax[3]
            }
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                cloudsPosX[0] = cloudsPosX[0] * -1
            }
            withAnimation(.linear(duration: 14).repeatForever(autoreverses: false)){
                cloudsPosX[1] = cloudsPosX[1] * -1
            }
        }
    }
}
extension GameView {
    private var obtacles: some View{
        ZStack{
            ObstacleView(posX: $obstaclesPosX[0])
            ObstacleView(posX: $obstaclesPosX[1])
            ObstacleView(posX: $obstaclesPosX[2])
            ObstacleView(posX: $obstaclesPosX[3])
           
        }
    }
    private var clouds: some View {
        ZStack{
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
                .offset(x: cloudsPosX[0], y: -229)
            Image("cloud")
                .resizable()
                .scaledToFit()
                .scaleEffect(x: -1)
                .frame(height: 29)
                .offset(x: cloudsPosX[1], y: -129)
        }
    }
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
