//
//  ViewController.swift
//  Poker
//
//  Created by yi-jia fu on 2019/3/8.
//  Copyright © 2019 yi-jia fu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount:Int = 0
    {                     //observer
        didSet{
            count.text = String("Flips:\(flipCount)")
        }
    }//
    var Emojichoice = ["🐶","🐱","🐭","🐹","🐨","🐰","🦊","🐻","🐼","🐮","🐷","🐧","🐞","🐥","🦋","🐝"]
   
    @IBOutlet weak var count: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func reset(_ sender: UIButton) {
        for index in self.cardButton{
            index.setTitle("",for:.normal)
            index.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 1)
        }
        flipCount = 0
    }
    @IBAction func all(_ sender: UIButton) {
        for index in self.cardButton{
            let number = Int.random(in: 0...15)
            if index.currentTitle != ""{
                index.setTitle(Emojichoice[number],for:UIControl.State.normal)
                index.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            }
            else{
                index.setTitle(Emojichoice[number],for:UIControl.State.normal)
                index.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
       }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardnum = cardButton.index(of:sender){
            //print("cardnum = \(String(describing: cardnum))")
            flipCard(withEmoji: Emojichoice[cardnum], on: sender)
        
        }else{
            print("not in!")
        }
        flipCount += 1
        //count.text = "Flips: \(flipCount)"
    }
 
    func flipCard(withEmoji emoji:String, on button:UIButton){
        if button.currentTitle == emoji{
            button.setTitle("",for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.4833308552, blue: 0.4168321393, alpha: 1)
        }else{
            button.setTitle(emoji,for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
}

