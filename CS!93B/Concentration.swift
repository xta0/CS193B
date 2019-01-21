//
//  Concentration.swift
//  CS!93B
//
//  Created by moxin on 1/20/19.
//  Copyright © 2019 Tao Xu. All rights reserved.
//

import Foundation

class Concentration {
    var cards: [Card] = []
    var indexOfFaceupCard: Int?
    func chooseCard(at index: Int) {
        if let matchIndex = indexOfFaceupCard {
            if index != matchIndex {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                indexOfFaceupCard = nil
            }
        } else {
            indexOfFaceupCard = index
        }
        cards[index].isFacedUp = true
    }
    func unchooseCards(with indexes: [Int]) {
        for index in indexes {
            cards[index].isFacedUp = false
        }

    }
    init(numberOfParisOfCards: Int) {
        //[1,numberOfParisOfCards]
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
}
