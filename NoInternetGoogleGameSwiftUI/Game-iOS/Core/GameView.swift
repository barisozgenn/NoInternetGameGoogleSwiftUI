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
   
    var body: some View {
        ZStack{
            CloudsView()
            ObstacleView()
                .offset(y: -39)
            scoreLabel
            
            GroundView()
                .offset(y: 39)
            DinoView()
        
        }
    }
}
extension GameView {
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
