//
//  Card.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/19.
//  Copyright © 2019 Leaco. All rights reserved.
//

import Foundation

struct Card: Hashable{
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    private static var identifierFactory=0

    private static func getUniqueIdentifier()->Int{
        Card.identifierFactory+=1
        return Card.identifierFactory;
    }
    
    init() {
        self.identifier=Card.getUniqueIdentifier()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
