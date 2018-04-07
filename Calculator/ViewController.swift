//
//  ViewController.swift
//  Calculator
//
//  Created by John Higgins M. Avila on 07/04/2018.
//  Copyright © 2018 John Higgins M. Avila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblInputBar: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var newOperation: Bool = true
    var isDotUsed: Bool = false
    var number1: Double?
    var number2: Double?
    var result: Double?
    var op: String = "+"
    var isPositive: Bool = true
    var number1IsPositive: Bool = true
    var number2IsPositive: Bool = true
    
    func addInputToText (num: String) {
        var textNumber: String? = String(lblInputBar.text!)
        if newOperation {
            textNumber = ""
            newOperation = false
        }
        if textNumber == "0" && num == "0" {
            lblInputBar.text = "0"
        } else if textNumber == "0" && num != "." {
            lblInputBar.text = num
        } else {
            textNumber = textNumber! + num
            lblInputBar.text = textNumber!
        }
    }

    func setOperator (operation: String) {
        op = operation
        if lblInputBar.text!.hasPrefix("-") {
            number1IsPositive = false
            number1 = Double(lblInputBar.text!.dropFirst())
        } else {
            number1 = Double(lblInputBar.text!)
        }
        lblInputBar.text = "0"
        newOperation = true
        isDotUsed = false
        isPositive = true
        newOperation = false
    }

    @IBAction func btnAC(_ sender: Any) {
        lblInputBar.text = "0"
        isDotUsed = false
        newOperation = true
        isPositive = true
    }
    @IBAction func btnInteger(_ sender: Any) {
        if isPositive && lblInputBar.text != "0" {
            lblInputBar.text = "-\(lblInputBar.text!)"
            isPositive = false
        } else if !isPositive {
            lblInputBar.text = String(lblInputBar.text!.dropFirst())
            isPositive = true
        }
    }
    @IBAction func btnPercent(_ sender: Any) {
        var percentage: Double?
        if isPositive && lblInputBar.text != "0" {
            percentage = Double(lblInputBar.text!)
            lblInputBar.text = String(percentage! * 0.01)
        } else if !isPositive {
            percentage = Double(lblInputBar.text!.dropFirst())
            lblInputBar.text = String("-\(percentage! * 0.01)")
        }
    }
    @IBAction func btn0(_ sender: Any) {
        addInputToText(num: "0")
    }
    @IBAction func btnDot(_ sender: Any) {
        if !isDotUsed {
            addInputToText(num: ".")
            isDotUsed = true
        }
    }
    @IBAction func btn1(_ sender: Any) {
        addInputToText(num: "1")
    }
    @IBAction func btn2(_ sender: Any) {
        addInputToText(num: "2")
    }

    @IBAction func btn3(_ sender: Any) {
        addInputToText(num: "3")
    }
    
    @IBAction func btn4(_ sender: Any) {
        addInputToText(num: "4")
    }
    
    @IBAction func btn5(_ sender: Any) {
        addInputToText(num: "5")
    }
    
    @IBAction func btn6(_ sender: Any) {
        addInputToText(num: "6")
    }
    
    @IBAction func btn7(_ sender: Any) {
        addInputToText(num: "7")
    }
    
    @IBAction func btn8(_ sender: Any) {
        addInputToText(num: "8")
    }

    @IBAction func btn9(_ sender: Any) {
        addInputToText(num: "9")
    }
    @IBAction func btnDiv(_ sender: Any) {
        setOperator(operation: "/")
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        setOperator(operation: "*")
    }
    @IBAction func btnSubtract(_ sender: Any) {
        setOperator(operation: "-")
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        setOperator(operation: "+")
    }
    
    @IBAction func btnEquals(_ sender: Any) {
        if !newOperation {
            if lblInputBar.text!.hasPrefix("-") {
                number2IsPositive = false
                number2 = Double(lblInputBar.text!.dropFirst())
            } else {
                number2 = Double(lblInputBar.text!)
            }
            switch op {
            case "+":
                result = ((number1IsPositive) ? number1! : number1! * -1) + ((number2IsPositive) ? number2! : number2! * -1)
            case "-":
                result = ((number1IsPositive) ? number1! : number1! * -1) - ((number2IsPositive) ? number2! : number2! * -1)
            case "*":
                result = ((number1IsPositive) ? number1! : number1! * -1) * ((number2IsPositive) ? number2! : number2! * -1)
            case "/":
                result = ((number1IsPositive) ? number1! : number1! * -1) / ((number2IsPositive) ? number2! : number2! * -1)
            default:
                result = 0
            }
            lblInputBar.text = String(result!)
            number2IsPositive = true
            number1IsPositive = true
            isPositive = true
            newOperation = true
        }
    }
}

