//
//  GroundView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 26.01.2023.
//

import SwiftUI

struct GroundView: View {
    @State private var groundPosX = 900.0
    var body: some View {
            HStack{
                Image("way")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 2900)
                    .offset(x: groundPosX)
            }
            .frame(width: 429)
            .clipped()
        .onAppear{
            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)){
                groundPosX = -900
            }
        }
    }
}

struct GroundView_Previews: PreviewProvider {
    static var previews: some View {
        GroundView()
    }
}
