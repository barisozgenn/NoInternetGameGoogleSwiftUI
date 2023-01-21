//
//  ContentView.swift
//  Game-iOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dinoCurrentImage = UIImage(named: "dino-idle")!
    var body: some View {
        ZStack{
            clouds
            
            Text("hello 00000")
                .font(.custom("PressStart2P", size: 29))
            
            Image("obstacle-1")
                .resizable()
                .scaledToFit()
                .frame(height: 92)
                .offset(x: 72, y: -7)
            VStack {
                dino
                ground
            }
        }
    }
}
extension ContentView {
    private var clouds: some View {
        ZStack{
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
                .offset(x: -92, y: -229)
            Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
                .offset(x: 72, y: -129)
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
        }
        .offset(y: -34)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
