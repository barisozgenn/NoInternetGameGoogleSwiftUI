//
//  GameView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI
import GameplayKit
struct GameView: View {
   
    @State private var score = 0
    @State var getScore = 0
    @State var isGameStart : Bool = false
    @State var dinoPosY = 0.0
    @State var dinoState : DinoStateModel = .walk
    
    var body: some View {
        ZStack{
            CloudsView()
            ObstacleView(isGameStart: $isGameStart, getScore: $getScore, dinoPosY: $dinoPosY, dinoState: $dinoState)
                .offset(y: -39)
            scoreLabel
            
            GroundView(dinoState: $dinoState)
                .offset(y: 39)
            DinoView(dinoPosY: $dinoPosY, dinoState: $dinoState, isGameStart: $isGameStart)
        
        }
    }
}
extension GameView {
    private var scoreLabel: some View {
        HStack{
            Text("HI \(String(format: "%.5d", getScore))")
                .font(Font.custom("RegularRockwell", size: 29))
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
