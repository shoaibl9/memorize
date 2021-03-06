//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Shoaib Laghari on 10/18/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let christmas = ["π","ππ½", "π€ΆπΌ", "π§π½βπ"]
    
    private static let thanksgiving = ["π¦","π₯", "πΉπ·", "π₯", "π₯§"]
    
    private static let halloween = ["π","π»", "π"]
    
    private static func createMemoryGame(emojis: Array<String>) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(emojis: christmas)
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame(_ mode: String) {
        if (mode == "christmas") {
            model = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.christmas)
        } else if (mode == "halloween") {
            model = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.halloween)
        } else if (mode == "thanksgiving") {
            model = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.thanksgiving)
        }
    }
}
