//
//  ObstacleView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 24.01.2023.
//
import SwiftUI
struct ObstacleView : View {
    let obstacleList =  ObstacleModel.allCases
    @State private var posX : Double = 0
    @State private var maxX: Double = 1992
    @State private var minX: Double = -1992
    @State var speed: Double = 14
    var body: some View {
        GeometryReader { geo in
            
            HStack(alignment: .bottom){
                Image(obstacleList[obstacleList.indices.randomElement()!].imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 72)
                ZStack{
                    Rectangle()
                        .frame(width: 29,height: 192)
                    
                }
            }
            .background(.yellow)
            .onAppear{
                maxX = geo.size.width + 129
                minX = maxX * -1
                posX = maxX
                
                withAnimation(.linear(duration: speed).repeatForever(autoreverses: false)){
                    posX = minX
                }
            }
            .offset(x: posX)
            
            Text("posX:\(posX)")
                .foregroundColor(.white)
        }
        .frame(height: 192)
        .background(.red)
        
    }
}

struct ObstacleView_Previews: PreviewProvider {
    static var previews: some View {
        ObstacleView().offset(x: 0, y: 0)
    }
}
