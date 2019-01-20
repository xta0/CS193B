//
//  Concentration.swift
//  CS!93B
//
//  Created by moxin on 1/20/19.
//  Copyright © 2019 Tao Xu. All rights reserved.
//

import Foundation

class Concentration: CustomStringConvertible {
    var cards: [Card] = []
    func chooseCard(at index: Int) {
        cards[index].isFacedUp = !cards[index].isFacedUp
    }
    init(numberOfParisOfCards: Int) {
        //[1,numberOfParisOfCards]
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
    var description: String {
        var res = ""
        for card in cards {
            res = String(card.identifier) + "," + card.emoji
            res += " "
        }
        return res
    }
}
