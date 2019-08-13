//
//  ViewController.swift
//  Calculator
//
//  Created by yi-jia fu on 2019/5/1.
//  Copyright © 2019 yi-jia fu. All rights reserved.
//

import UIKit

enum OperationType{
    case add
    case subtract
    case multiply
    case divide
    case none
}

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation:OperationType = .none
    var startNew = true

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var label: UILabel!
    
    func makeOKNumberString(from number:Double){
        var okText:String
        
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 10{
            okText = String(okText.prefix(10))
        }
        label.text = okText
    }
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        label.text = "-"
        operation = .subtract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "x"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        operation = .divide
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true{
            switch operation{
                case .add:
                    numberOnScreen = previousNumber + numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
//                    label.text = "\(previousNumber + numberOnScreen)"
                case .subtract:
                    numberOnScreen = previousNumber - numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
//                    label.text = "\(previousNumber - numberOnScreen)"
                case .multiply:
                    numberOnScreen = previousNumber * numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
//                    label.text = "\(previousNumber * numberOnScreen)"
                case .divide:
                    if numberOnScreen > 0{
                        numberOnScreen = previousNumber / numberOnScreen
                        makeOKNumberString(from: numberOnScreen)
                    }else{
                        label.text = "error"
                    }
                
//                    label.text = "\(previousNumber / numberOnScreen)"
                case .none:
                    label.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if label.text != nil{
            if startNew == true{
                label.text = "\(inputNumber)"
                startNew = false
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/"{
                    label.text = "\(inputNumber)"
                }
                else{
                    label.text = label.text! + "\(inputNumber)"
                }
            }
            numberOnScreen = Double(label.text!) ?? 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

