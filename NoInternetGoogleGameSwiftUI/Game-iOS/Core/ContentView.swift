//
//  ContentView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dinoCurrentImage = UIImage(named: "dino-idle")!
    @State private var cloudsPosX = [258.0, 329.0]
    @State private var groundPosX = 1600.0
    @State private var obstaclesPosX = [1000.0, 1350.0, 1700.0, 2050.0]
    private let obstaclesPosXMax = [-2200.0, -1850.0, -1500.0, -1150]
    
    var body: some View {
        ZStack{
            clouds
            obtacles
            
            Text("hello 00000")
                .font(.custom("PressStart2P", size: 29))
            
            VStack {
                ground
                dino
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
extension ContentView {
    private var obtacles: some View{
        ZStack{
            ObstacleView().offset(x: obstaclesPosX[0], y: 29)
            ObstacleView().offset(x: obstaclesPosX[1], y: 29)
            ObstacleView().offset(x: obstaclesPosX[2], y: 34)
            ObstacleView().offset(x: obstaclesPosX[3], y: 32)
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
                .frame(height: 29)
                .offset(x: cloudsPosX[1], y: -129)
        }
    }
    private var dino: some View {
        Image(uiImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 107)
            .offset(x: -107)
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
    
    struct ObstacleView : View {
        let obstacleList =  ObstacleModel.allCases
        var body: some View {
            Image(obstacleList[obstacleList.indices.randomElement()!].imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 72)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
