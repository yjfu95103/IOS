//
//  ViewController.swift
//  Poker
//
//  Created by yi-jia fu on 2019/3/8.
//  Copyright © 2019 yi-jia fu. All rights reserved.
//

//default to iphone7

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame(numberOfPairsOfCard: numberOfPairsCard)
    
    var flipallCard = false
    
    var resetCard = false
    
    var click = Array(repeating: 0, count: 16)
    
    var tempCard = Array(repeating: 0, count: 0)
    
    var tempEmoji = Array(repeating: 0, count: 0)
    
    var tempCount:Int = 0
    
    var randomStyle:Int = 0
    
    var numberOfPairsCard:Int{
        return (cardButton.count+1)/2
    }
    
    var flipCount:Int = 0
    {                     //observer
        didSet{
            count.text = String("Flips:\(flipCount)")
        }
    }
    
    var scoreGet:Int = 0
    {                     //observer
        didSet{
            score.text = String("Score:\(scoreGet)")
        }
    }
    var emojiAnimal = ["🐶","🐣","🐭","🐹","🐝","🐨","🐰","🐳"]
    var emojiSports = ["⚽️","🏀","🏈","⚾️","🎱","🏓","🏸","🛹"]
    var emojiFoods = ["🍔","🍤","🍕","🍭","🍙","🥐","🍜","🍰"]
    var emojiFaces = ["😃","😅","😝","😍","😡","🥶","😈","👻"]
    var emojiFlags = ["🏳️‍🌈","🇹🇼","🇨🇦","🇰🇷","🇮🇹","🇳🇿","🇺🇸","🇧🇷"]
    var emojiStar = ["♈️","♉️","♊️","♋️","♌️","♍️","♎️","♏️"]
    lazy var emojiRandom = [emojiAnimal, emojiSports, emojiFoods, emojiFaces, emojiFlags, emojiStar]
    lazy var temp = emojiRandom.shuffled()

    lazy var Emojichoice = temp[0]

    var emoji = [Int:String]()
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardnum = cardButton.index(of:sender){
            let card = game.cards[cardnum]
            if !card.isMatched{
                flipCount += 1
            }
            game.chooseCard(at: cardnum)
            updateViewFromModel()
            if !card.isMatched,!card.isFaceUp{
                tempCard.append(cardnum)
                tempEmoji.append(card.identifier)
                print("card:",tempCard)
                print("emoji:",tempEmoji)
                print("cardCount:",tempCard.count)
                print("tempCount:",tempCount)
                
                if tempEmoji.count%2 == 0,flipCount>=2{
                    print("temp first :",tempCount)
                    if (tempCard[tempCount] != tempCard[tempCount+1]){ //can't continuous click same one to get points
                        if (tempEmoji[tempCount] != tempEmoji[tempCount+1]){       //two cards is diff ,no matching
                            minusPoints(id: tempCard[tempCount])
                            minusPoints(id: tempCard[tempCount+1])
                        }else{                                                    //two cards is the same ,matching
                            scoreGet += 2
                        }
                    }
                    tempCard.removeAll()
                    tempEmoji.removeAll()
                }
            }else if !card.isMatched,card.isFaceUp{             //open and close the same one minus one point
                print("minus one point")
                scoreGet -= 1
                minusPoints(id: tempCard[tempCount])
                tempCard.removeAll()
                tempEmoji.removeAll()
            }
            print("score:",scoreGet)
        }else{
            print("not in!")
        }
    }
    
    func minusPoints(id: Int){                   //16 cards emoji's record
        switch id {                              //if flip 2 times no matching(for score -1)
        case 0:
            click[0] += 1
            if click[0]>=2{scoreGet -= 1}
            break;
        case 1:
            click[1] += 1
            if click[1]>=2{scoreGet -= 1}
            break;
        case 2:
            click[2] += 1
            if click[2]>=2{scoreGet -= 1}
            break;
        case 3:
            click[3] += 1
            if click[3]>=2{scoreGet -= 1}
            break;
        case 4:
            click[4] += 1
            if click[4]>=2{scoreGet -= 1}
            break;
        case 5:
            click[5] += 1
            if click[5]>=2{scoreGet -= 1}
            break;
        case 6:
            click[6] += 1
            if click[6]>=2{scoreGet -= 1}
            break;
        case 7:
            click[7] += 1
            if click[7]>=2{scoreGet -= 1}
            break;
        case 8:
            click[8] += 1
            if click[8]>=2{scoreGet -= 1}
            break;
        case 9:
            click[9] += 1
            if click[9]>=2{scoreGet -= 1}
            break;
        case 10:
            click[10] += 1
            if click[10]>=2{scoreGet -= 1}
            break;
        case 11:
            click[11] += 1
            if click[11]>=2{scoreGet -= 1}
            break;
        case 12:
            click[12] += 1
            if click[12]>=2{scoreGet -= 1}
            break;
        case 13:
            click[13] += 1
            if click[13]>=2{scoreGet -= 1}
            break;
        case 14:
            click[14] += 1
            if click[14]>=2{scoreGet -= 1}
            break;
        case 15:
            click[15] += 1
            if click[12]>=2{scoreGet -= 1}
            break;
        default:
            break;
        }
    }

    func updateViewFromModel(){                //update card
        for index in cardButton.indices{
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card),for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                if card.isMatched{
                    button.setTitle(emoji(for: card),for:UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 0.5412564212)
                }
            }else{
                button.setTitle("",for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 1)
            }
            if card.isMatched{
                button.setTitle(emoji(for: card),for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 0.5412564212)
            }
        }
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {     //reset all card
        for index in self.cardButton{
            index.setTitle("",for:.normal)
            index.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 1)
        }
        game.reset()
        click = Array(repeating: 0, count: 16)
        flipCount = 0
        scoreGet = 0
        tempCard.removeAll()
        tempEmoji.removeAll()
        emoji.removeAll()
        tempCount = 0
        cardButton.shuffle()
        Emojichoice = emojiRandom.shuffled()[0]
        flipallCard = false
    }
    
    @IBAction func flipall(_ sender: UIButton) {             //flip all card
        if flipallCard == false{
            game.flipall()
            updateViewFromModel()
            flipallCard = true
        }else{
            game.reset()
            click = Array(repeating: 0, count: 16)
            flipCount = 0
            scoreGet = 0
            tempCard.removeAll()
            tempEmoji.removeAll()
            tempCount = 0
            updateViewFromModel()
            flipallCard = false
        }
    }
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, Emojichoice.count > 0{
            emoji[card.identifier] = Emojichoice.remove(at:Emojichoice.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

extension Int{
    var arc4random:Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self<0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
    }
}

