//
//  MainUIViewController.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/18.
//  Copyright © 2019 Leaco. All rights reserved.
//

import UIKit

class MainUIViewController: UIViewController {

    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)

    var numberOfPairsOfCards: Int {
        (cardButtons.count + 1) / 2;
    }

    private(set) var filpCount = 0 {
        didSet {
            filpCountLabel.text = "Filps:\(filpCount)"
        }
    }


    @IBOutlet private weak var filpCountLabel: UILabel!

    @IBOutlet private var cardButtons: [UIButton]!

    @IBAction private func touchCard(_ sender: UIButton) {
        filpCount += 1
        if let cardNo: Int = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNo)
            updateViewFromModel()

        } else {
            print("choose card not in list")
        }
    }

    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojy(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }

    private var emoji = [Card: String]()
    private var emojyChoices = ["😈", "👹", "😽", "🎃", "🦇", "🐝", "🐹", "🐨", "🦞", "🍎"]

    private func emojy(for card: Card) -> String? {
        let emojiCount = emojyChoices.count
        if emoji[card] == nil, emojiCount > 0 {
            emoji[card] = emojyChoices.remove(at: emojiCount.arc4random)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}