//
//  Game_MacOSApp.swift
//  Game-MacOS
//
//  Created by Baris OZGEN on 14.01.2023.
//

import SwiftUI

@main
struct Game_MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
        }        
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified)
        .windowResizability(.contentMinSize)
        .defaultSize(width: 450, height: 372)
    }
}
