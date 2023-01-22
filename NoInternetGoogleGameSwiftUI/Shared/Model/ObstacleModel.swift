//
//  ObstacleModel.swift
//  NoInternetGoogleGameSwiftUI
//
//  Created by Baris OZGEN on 22.01.2023.
//

import Foundation
enum ObstacleModel : Int, CaseIterable, Identifiable {
    case obs1
    case obs2
    case obs3
    case obs4
    
    var id : Int { return rawValue}
    
    var imageName : String {
        switch self {
            
        case .obs1:
            return "obstacle-1"
        case .obs2:
            return "obstacle-2"
        case .obs3:
            return ""
        case .obs4:
            return "obstacle-group-2"
        }
    }
}
