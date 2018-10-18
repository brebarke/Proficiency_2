//
//  ViewController.swift
//  Proficiency_2
//
//  Created by Brett Barker on 10/9/18.
//  Copyright © 2018 Brett Barker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    var num1 = ""
    var num2 = ""
    var operation = ""
    var isnum1 = true
    var operationpresent = false
    var clear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonPress(_ sender: UIButton) {
        if clear {
            answerLabel.text = ""
            clear = false
        }
        let curText = answerLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "x", "/", "-":
                if operationpresent {
                    return
                }
                operation = text
                isnum1 = false
                operationpresent = true
                answerLabel.text = "\(curText) \(operation) "
                break
            case "=":
                isnum1 = true
                operationpresent = false
                clear = true
                let result = calculate()
                answerLabel.text = "\(result)"
                break
            default:
                if isnum1 {
                    num1 = "\(num1)\(text)"
                } else {
                    num2 = "\(num2)\(text)"
                }
                answerLabel.text = "\(curText)\(text)"
                break;
        
        }
    }
}
func calculate() -> Double {
    let firstNum = Double(num1)!
    let secondNum = Double(num2)!
    num1 = ""
    num2 = ""
    switch operation {
    case "+":
        return firstNum + secondNum
    case "-":
        return firstNum - secondNum
    case "x":
        return firstNum * secondNum
    case "/":
        return firstNum / secondNum
    default:
        return 0
        }
    }

    

}

//resource: https://github.com/fnk0/iOS-Calculator-Tutorial
