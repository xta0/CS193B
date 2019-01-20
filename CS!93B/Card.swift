//
//  Card.swift
//  CS!93B
//
//  Created by moxin on 1/20/19.
//  Copyright © 2019 Tao Xu. All rights reserved.
//

import UIKit

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    var emoji: String = ""
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    static var emojis: [String] = ["⚽️", "🏀", "🥎", "🏉", "🏓", "🥊"]
    static func randomEmoji() -> String?{
        if !emojis.isEmpty {
            let index = Int(arc4random_uniform(UInt32(emojis.count)))
            return emojis.remove(at: index)
        } else {
            return nil
        }
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        self.emoji = Card.randomEmoji() ?? "?"
    }
}
