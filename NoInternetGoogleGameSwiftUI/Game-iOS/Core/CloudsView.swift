//
//  CloudsView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 25.01.2023.
//

import SwiftUI

struct CloudsView: View {
    @State private var cloudsPosX = [258.0, -229.0]
    @State private var cloudsPosY = [-229, -129.0]
    var body: some View {
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
        .onAppear{
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                cloudsPosX[0] = cloudsPosX[0] * -1
                
                
                if -228.29 > cloudsPosX[0] {
                    cloudsPosY[0] = Double.random(in: -207.0 ... -229.0)
                }
            }
            withAnimation(.linear(duration: 14).repeatForever(autoreverses: false)){
                cloudsPosX[1] = cloudsPosX[1] * -1
                
                if -127.29 > cloudsPosX[1] {
                    cloudsPosY[1] = Double.random(in: -107.0 ... -129.0)
                }
            }
        }
    }
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
        CloudsView()
    }
}
