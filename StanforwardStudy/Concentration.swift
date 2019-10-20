//
//  Concentration.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/19.
//  Copyright © 2019 Leaco. All rights reserved.
//

import Foundation

class Concentration {

    var cards = [Card]()


    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //洗牌

    }

    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {

                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // 没有，或者有两张卡片方向向上
                for filpDownIndex in cards.indices {
                    cards[filpDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index

            }

        }

    }
}
