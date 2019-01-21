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
    static var emojis: [String] = ["🇨🇳", "🇧🇷", "🇨🇦", "🇺🇲", "🇯🇵", "🇰🇷", "🇩🇪", "🇳🇬", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇧", "🇨🇵", "🇪🇦", "🇨🇺"]
    static func randomEmoji() -> String? {
        if  emojis.count > 0 {
            let index = Int(arc4random_uniform(UInt32(emojis.count)))
            let res =  emojis.remove(at: index)
            return res
        } else {
            return nil
        }
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
        self.emoji = Card.randomEmoji() ?? "?"
    }
}
