//
//  ObstacleView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 24.01.2023.
//
import SwiftUI
import GameplayKit
struct ObstacleView : View {
    let obstacleList =  ObstacleModel.allCases
    @Binding var posX : Double
    var body: some View {
        ZStack{
                Rectangle()
                    .frame(width: 29,height: 192)
                    .offset(x: 58, y: -58)
            
            Image(obstacleList[obstacleList.indices.randomElement()!].imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 72)
            
                
        }
        .offset(x: posX, y: 29)
    }
}

struct ObstacleView_Previews: PreviewProvider {
    static var previews: some View {
        ObstacleView(posX: .constant(0)).offset(x: 0, y: 0)
    }
}
