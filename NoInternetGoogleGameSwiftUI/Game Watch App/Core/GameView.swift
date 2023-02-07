//
//  GameView.swift
//  Game Watch App
//
//  Created by Baris OZGEN on 7.02.2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var score = 0
    @State var getScore = 0
    @State var isGameStart : Bool = false
    @State var dinoPosY = 0.0
    @State var dinoState : DinoStateModel = .walk
    @State var colliderHit = false
    @State private var playLabelOpacity = 1.0
    
    var body: some View {
        ZStack{
            CloudsView()
                .offset(y: 114)
            ObstacleView(colliderHit: $colliderHit, isGameStart: $isGameStart, getScore: $getScore, dinoPosY: $dinoPosY, dinoState: $dinoState)
                .offset(y: 0)
            scoreLabel
                .offset(y: -58)
            
            GroundView(dinoState: $dinoState)
                .offset(y: 72)
            DinoView(dinoPosY: $dinoPosY, dinoState: $dinoState, isGameStart: $isGameStart)
                .offset(y: 42)
            replayButton
                .offset(y: -29)
            playLabel
        }
        .scaleEffect(0.5)
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
                .padding()
            }
        }
    }
    
    private var playLabel: some View {
        VStack{
            
            Text("Tap Space".uppercased())
            Text("to Play")
                .font(.title2)
                .foregroundColor(.gray)
                .fontWeight(.bold)
        }
        .opacity(playLabelOpacity)
        .onAppear{
            withAnimation(.spring().delay(2)){
                playLabelOpacity = 0.0
            }
        }
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
