//
//  DinoView.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 25.01.2023.
//

import SwiftUI

struct DinoView: View {
    @State private var dinoCurrentImage = UIImage(named: "dino-idle")!
    @State var dinoPosY = 0.0
    @State var dinoPosX = -129.0
    @State var dinoState : DinoStateModel = .walk
    let timer = Timer.publish(every: 0.0258, on: .main, in: .common).autoconnect()
    @State private var isJumping = false
    @State private var isFixPosX = false
    
    var body: some View {
        Image(uiImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 107)
            .offset(x: dinoPosX, y: dinoPosY)
            .onAppear{
                getDinoState(state: dinoState)
            }
            .onChange(of: dinoState) { newDinoState in
                getDinoState(state: newDinoState)
            }
            .onTapGesture {
                getDinoState(state: .jump)
            }
            .onReceive(timer) { _ in
                if dinoState == .jump {
                    if dinoPosY > -192 && !isJumping{
                        dinoPosY -= 14
                        dinoPosX += 3.29
                    }
                    else if dinoPosY < -7 && isJumping{
                        dinoPosY += 14
                        dinoPosX += 3.29
                    }
                    
                    
                    if dinoPosY <= -192 {
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            dinoPosX -= 1
                        }
                    }
                }
            }
    }
}
extension DinoView{
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
    
    
}
struct DinoView_Previews: PreviewProvider {
    static var previews: some View {
        DinoView()
    }
}
