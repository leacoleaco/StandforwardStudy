//
//  Card.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/19.
//  Copyright © 2019 Leaco. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory=0
    
    static func getUniqueIdentifier()->Int{
        Card.identifierFactory+=1
        return Card.identifierFactory;
    }
    
    init() {
        self.identifier=Card.getUniqueIdentifier()
    }
}
