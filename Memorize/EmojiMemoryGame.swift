//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Shoaib Laghari on 10/18/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🚂","🚀", "🚁", "🚜", "🚗", "🛵", "🚙", "🚑", "🚚", "🛻", "🏍", "🚍", "🛩", "🛴", "🛳", "🛺", "🏎", "🚔", "🚤", "🚠", "🚄", "🛫", "🚲", "🚐"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
