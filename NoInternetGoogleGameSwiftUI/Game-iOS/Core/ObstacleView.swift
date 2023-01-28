//
//  ObstacleView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 24.01.2023.
//
import SwiftUI
struct ObstacleView : View {
    @State private var posX : Double = 0
    @State private var posXs : [Double] = [0.0,0.0,0.0,0]
    @State private var maxX: Double = 500
    @State private var minX: Double = -500
    @State var speed: Double = 15.0
    let range = 92.0...192
    @State var changeIt = false
    @State var colliderHit = false
    @State var getScore = false
    let timer = Timer.publish(every: 0.007, on: .main, in: .common).autoconnect()
    
    var body: some View {
           
                ZStack{
                    ObstaclePrefab(changeIt: $changeIt, posX: $posXs[0], colliderHit: $colliderHit, getScore: $getScore)
                        .position(x: posXs[0], y: 96)
                    ObstaclePrefab(changeIt: $changeIt, posX: $posXs[1], colliderHit: $colliderHit, getScore: $getScore)
                        .position(x: posXs[1], y: 96)
                    ObstaclePrefab(changeIt: $changeIt, posX: $posXs[2], colliderHit: $colliderHit, getScore: $getScore)
                        .position(x: posXs[2], y: 96)
                    ObstaclePrefab(changeIt: $changeIt, posX: $posXs[3], colliderHit: $colliderHit, getScore: $getScore)
                        .position(x: posXs[3], y: 96)
                }
                .onAppear{
                    changeIt.toggle()
                    posX = maxX
                   posXs = [posX, posX+258, posX+592, posX+900]
                }
                .onReceive(timer) { _ in
                    posX -= 1
                    posXs = [posX, posX+258, posX+592, posX+900]
                    
                    if posX < -990 {
                        posX = maxX
                    }
                }
        .frame(width: 430,height: 192)
        .clipped()
        //.background(.red)
        
    }
}

private struct ObstaclePrefab: View {
    @Binding var changeIt : Bool
    @Binding var posX : Double
    @Binding var colliderHit : Bool
    @Binding var getScore : Bool
    let obstacleList =  ObstacleModel.allCases
@State private var image = ""
    var body: some View {
            HStack(alignment: .bottom){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72,height: 72)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 29,height: 192)
                      Text("\(String(format: "%.0f",posX))")
                }
            }
            //.background(.yellow)
            .onChange(of: changeIt, perform: { _ in
                image = obstacleList[obstacleList.indices.randomElement()!].imageName
            })
    }
}
struct ObstacleView_Previews: PreviewProvider {
    static var previews: some View {
        ObstacleView().offset(x: 0, y: 0)
    }
}
