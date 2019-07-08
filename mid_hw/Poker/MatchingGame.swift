//
//  MatchingGame.swift
//  Poker
//
//  Created by yi-jia fu on 2019/3/15.
//  Copyright © 2019 yi-jia fu. All rights reserved.
//

import Foundation

struct MatchingGame{
    
    var cards:[Card] = []
    
    mutating func reset(){
        for index in cards.indices{
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
    }
    
    mutating func flipall(){
        for index in cards.indices{
            cards[index].isFaceUp = true
            cards[index].isMatched = true
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue) //newValue預設值
            }
        }
    }
    
    mutating func chooseCard(at index:Int){
        if !cards[index].isMatched{//已經match不動作
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex == index{
               cards[index].isFaceUp = false
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int){
        for _ in 1...numberOfPairsOfCard{
            let card = Card()
            cards += [card,card]//個別不同
            //            cards.append(card)
            //            let matchingCard = Card(identifier: i)
            //            cards.append(matchingCard)
        }
    }
    
}


