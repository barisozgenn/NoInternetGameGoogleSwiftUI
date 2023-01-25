//
//  CloudsView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 25.01.2023.
//

import SwiftUI

struct CloudsView: View {
    @State private var cloudsPosX = [300.0, 300.0, 300]
    @State private var cloudsPosY = [-229, -129.0, -292]
    var body: some View {
        ZStack{
            
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height: 14)
                .offset(x: cloudsPosX[2], y: cloudsPosY[2])
            
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
                .offset(x: cloudsPosX[0], y: cloudsPosY[0])
            
            Image("cloud")
                .resizable()
                .scaledToFit()
                .scaleEffect(x: -1)
                .frame(height: 29)
                .offset(x: cloudsPosX[1], y: cloudsPosY[1])
        }
        .onAppear{
            withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)){
                cloudsPosX[2] = -229.0
            }
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                cloudsPosX[0] = -229.0
            }
            withAnimation(.linear(duration: 14).repeatForever(autoreverses: false)){
                cloudsPosX[1] = -229.0
            }
        }
    }
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
        CloudsView()
    }
}
