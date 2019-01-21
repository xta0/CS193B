//
//  ViewController.swift
//  CS!93B
//
//  Created by moxin on 1/20/19.
//  Copyright © 2019 Tao Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfParisOfCards: (cardButtons.count+1 ) / 2)
    var flipCount = 0 {
        //propery oberserver
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("\(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateCard()
        }
    }
    func updateCard() {
        var faceUpIndexes: [Int] = []
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(card.emoji, for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                faceUpIndexes.append(index)
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.7502992749, blue: 0.1573188901, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
        if faceUpIndexes.count == 2 {
            //check match
            view.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                //check matched
                for index in faceUpIndexes {
                    self.cardButtons[index].isHidden = self.game.cards[index].isMatched
                }
                self.game.unchooseCards(with: faceUpIndexes)
                self.updateCard()
                self.view.isUserInteractionEnabled = true
            })
        }
    }
}
