//
//  DinoView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 25.01.2023.
//

import SwiftUI

struct DinoView: View {
    #if os(macOS)
    @State private var dinoCurrentImage = NSImage(named: "dino-idle")!
    #else
    @State private var dinoCurrentImage = UIImage(named: "dino-idle")!
    #endif
    @Binding var dinoPosY: Double
    @State var dinoPosX = -129.0
    @Binding var dinoState : DinoStateModel
    let timer = Timer.publish(every: 0.0258, on: .main, in: .common).autoconnect()
    @State private var isJumping = false
    @State private var isFixPosX = false
    @Binding var isGameStart : Bool
    var body: some View {
        ZStack{
            dinoImageView
                .offset(x: dinoPosX, y: dinoPosY)
                .onAppear{
                    getDinoState(state: dinoState)
                }
                .onChange(of: dinoState) { newDinoState in
                    getDinoState(state: newDinoState)
                }
                .onTapGesture {
                    if dinoState == .walk {
                        getDinoState(state: .jump)
                        isGameStart = true
                    }
                }
        }
            .onReceive(timer) { _ in
                
                
                if dinoState == .jump {
                    if dinoPosY > -92 && !isJumping{
                        dinoPosY -= 14
                       // dinoPosX += 3.29
                    }
                    else if dinoPosY > -158 && !isJumping{
                        dinoPosY -= 10
                       // dinoPosX += 3.29
                    }
                    else if dinoPosY > -207 && !isJumping{
                        dinoPosY -= 5
                       // dinoPosX += 3.29
                    }
                    
                    else if dinoPosY < -7 && isJumping{
                        dinoPosY += 10
                       // dinoPosX += 3.29
                    }
                
                    
                    
                    if dinoPosY <= -207 {
                        isJumping = true
                        isFixPosX = false
                    }
                    else if dinoPosY >= -7 && isJumping {
                        isJumping = false
                        getDinoState(state: .walk)
                    }
                }
                else if dinoState == .walk {
                    if !isFixPosX {
                        isFixPosX.toggle()
                        
                    }
                }
            }
    }
}
extension DinoView{
#if os(macOS)
    private var dinoImageView: some View {
        #if os(macOS)
        Image(nsImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 107)
        #else
        Image(uiImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 107)
        #endif
    }
    func getDinoState(state newDinoState: DinoStateModel){
        dinoState = newDinoState
        
        switch newDinoState {
        case .walk:
            dinoCurrentImage = NSImage(named: "\(dinoState.imageName)left")!
          
            withAnimation(.spring(response: 0.04).repeatForever()){
                dinoCurrentImage = NSImage(named: "\(dinoState.imageName)right")!
            }
        case .jump:
            dinoCurrentImage = NSImage(named: newDinoState.imageName)!
        default:
            dinoCurrentImage = NSImage(named: newDinoState.imageName)!
        }
    }
    #else
    func getDinoState(state newDinoState: DinoStateModel){
        dinoState = newDinoState
        
        switch newDinoState {
        case .walk:
            dinoCurrentImage = UIImage(named: "\(dinoState.imageName)left")!
          
            withAnimation(.spring(response: 0.04).repeatForever()){
                dinoCurrentImage = UIImage(named: "\(dinoState.imageName)right")!
            }
        case .jump:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        default:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        }
    }
    #endif
    
}
struct DinoView_Previews: PreviewProvider {
    static var previews: some View {
        DinoView(dinoPosY: .constant(0), dinoState: .constant(.walk), isGameStart: .constant(false))
    }
}
