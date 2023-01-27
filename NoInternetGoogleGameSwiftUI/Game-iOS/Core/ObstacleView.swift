//
//  ObstacleView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 24.01.2023.
//
import SwiftUI
struct ObstacleView : View {
    @State private var posX : Double = 0
    @State private var maxX: Double = 500
    @State private var minX: Double = -500
    @State var speed: Double = 15.0
    let range = 92.0...192
    @State var newText = ""
    @State var changeIt = false
    let timer = Timer.publish(every: 0.009, on: .main, in: .common).autoconnect()
    
    var body: some View {
           
                ZStack{
                    ObstaclePrefab(changeIt: $changeIt)
                        .position(x: posX, y: 96)
                    ObstaclePrefab(changeIt: $changeIt)
                        .position(x: posX + 258, y: 96)
                    ObstaclePrefab(changeIt: $changeIt)
                        .position(x: posX + 592, y: 96)
                    ObstaclePrefab(changeIt: $changeIt)
                        .position(x: posX + 900, y: 96)
                    Text("\(newText)")
                }
                .onAppear{
                    changeIt.toggle()
                    posX = maxX
                   
                }
                .onReceive(timer) { _ in
                    posX -= 1
                    newText = "\(posX)"
                    
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
