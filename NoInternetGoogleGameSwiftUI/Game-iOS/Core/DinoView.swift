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
    @State var dinoState : DinoStateModel = .walk

    var body: some View {
        Image(uiImage: dinoCurrentImage)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 107)
            .offset(x: -107, y: dinoPosY)
            .onAppear{
                getDinoState(state: dinoState)
            }
            .onChange(of: dinoState) { newDinoState in
                getDinoState(state: newDinoState)
            }
    }
}
extension DinoView{
    func getDinoState(state newDinoState: DinoStateModel){
        switch newDinoState {
        case .walk:
            dinoCurrentImage = UIImage(named: "\(dinoState.imageName)left")!
            
            
            dinoPosY = 0
            withAnimation(.spring(response: 0.04).repeatForever()){
                dinoCurrentImage = UIImage(named: "\(dinoState.imageName)right")!
            }
        case .jump:
            withAnimation(.spring()){
                dinoCurrentImage = UIImage(named: newDinoState.imageName)!
            }
            withAnimation(.spring(response: 2)){
                if dinoPosY == 0 {
                    dinoPosY = -129}
                else if dinoPosY < -114 {dinoState = .walk}
            }
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
