//
//  Card.swift
//  Poker
//
//  Created by yi-jia fu on 2019/3/15.
//  Copyright © 2019 yi-jia fu. All rights reserved.
//

import Foundation

struct Card : Hashable
{
    var isFaceUp = false
    var isMatched = false
    var identifier:Int //use id ,not emoji

    static var identifierFactory = 0
    static func getUnitIdentifier()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUnitIdentifier()
    }
    
    
}
