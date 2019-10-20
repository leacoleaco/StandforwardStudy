//
//  MainUIViewController.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/18.
//  Copyright © 2019 Leaco. All rights reserved.
//

import UIKit

class MainUIViewController: UIViewController {

    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)


    var filpCount = 0 {
        didSet {
            filpCountLabel.text = "Filps:\(filpCount)"
        }
    }


    @IBOutlet weak var filpCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
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

    var emoji = [Int: String]()
    var emojyChoices = ["😈", "👹", "😽", "🎃", "🦇", "🐝", "🐹", "🐨", "🦞", "🍎"]

    func emojy(for card: Card) -> String? {
        let emojiCount = emojyChoices.count
        if emoji[card.identifier] == nil, emojiCount > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCount)))
            emoji[card.identifier] = emojyChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
