//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tao Xu on 1/18/25.
//

// A view model

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["💩", "😈",  "👻", "🎃","👺", "💀", "😡", "🤡", "😶‍🌫️", "😱", "🤖", "👽"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: 12) { index in
            if index < self.emojis.count {
                return self.emojis[index]
            }
            return "⁉️"
        }
    }
    
    @Published
    private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var color: Color {
        return .orange
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
