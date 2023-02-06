//
//  GameView.swift
//  Game-watchOS
//
//  Created by Baris OZGEN on 6.02.2023.
//

import SwiftUI

struct GameView: View {
   
    @State private var score = 0
    @State var getScore = 0
    @State var isGameStart : Bool = false
    @State var dinoPosY = 0.0
    @State var dinoState : DinoStateModel = .walk
    @State var colliderHit = false

    var body: some View {
        ZStack{
            CloudsView()
            ObstacleView(colliderHit: $colliderHit, isGameStart: $isGameStart, getScore: $getScore, dinoPosY: $dinoPosY, dinoState: $dinoState)
                .offset(y: -39)
            scoreLabel
            
            GroundView(dinoState: $dinoState)
                .offset(y: 39)
            DinoView(dinoPosY: $dinoPosY, dinoState: $dinoState, isGameStart: $isGameStart)
            replayButton
                
        }
    }
}
extension GameView {
    private var scoreLabel: some View {
        HStack{
            Text("HI \(String(format: "%.5d", getScore))")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color(.darkGray))
        }
        .frame(maxWidth: 350, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
        .zIndex(1)
    }
    private var replayButton: some View {
        VStack{
            Spacer()
            if dinoState == .gameOver {
                Button {
                    dinoPosY = -7
                    dinoState = .walk
                    colliderHit = false
                    isGameStart = true
                    score = 0
                    getScore = 0
                    
                } label: {
                    VStack{
                        
                        Image("btn-play-again")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 72)
                        Text("play again".uppercased())
                            .font(.title2)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        

    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

