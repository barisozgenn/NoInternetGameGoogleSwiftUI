//
//  DinoStateModel.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 22.01.2023.
//

import Foundation

enum DinoStateModel : Int, CaseIterable, Identifiable {
    case idle
    case walk
    case gameOver
    case jump
    
    var id : Int { return rawValue}
    
    var imageName : String {
        switch self {
            
        case .idle:
            return "dino-idle"
        case .walk:
            return "dino-walk-"
        case .gameOver:
            return ""
        case .jump:
            return "dino-idle-noeye"
        }
    }
}
