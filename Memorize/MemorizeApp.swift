//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Shoaib Laghari on 10/16/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
