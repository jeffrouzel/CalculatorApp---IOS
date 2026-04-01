//
//  ViewController.swift
//  FirstProject
//
//  Created by training2 on 3/31/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblScreen: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btn_period: UIButton!
    
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSolve: UIButton!
    
    @IBOutlet weak var btn_0: UIButton!
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    @IBOutlet weak var btn_4: UIButton!
    @IBOutlet weak var btn_5: UIButton!
    @IBOutlet weak var btn_6: UIButton!
    @IBOutlet weak var btn_7: UIButton!
    @IBOutlet weak var btn_8: UIButton!
    @IBOutlet weak var btn_9: UIButton!
    @IBOutlet weak var btn_00: UIButton!
    
    var equation = ""
    let operators: [Character] = ["+", "-", "*", "/"]
    var solved: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        lblScreen.layer.borderWidth = 2.0
        lblScreen.layer.borderColor = UIColor.black.cgColor
        lblScreen.layer.cornerRadius = 8.0
        
        lblScreen.text = ""
        lblError.text = ""
        }

    @IBAction func num0(_ sender: UIButton) {appendNumber("0")}
    @IBAction func num1(_ sender: UIButton) {appendNumber("1")}
    @IBAction func num2(_ sender: UIButton) {appendNumber("2")}
    @IBAction func num3(_ sender: UIButton) {appendNumber("3")}
    @IBAction func num4(_ sender: UIButton) {appendNumber("4")}
    @IBAction func num5(_ sender: UIButton) {appendNumber("5")}
    @IBAction func num6(_ sender: UIButton) {appendNumber("6")}
    @IBAction func num7(_ sender: UIButton) {appendNumber("7")}
    @IBAction func num8(_ sender: UIButton) {appendNumber("8")}
    @IBAction func num9(_ sender: UIButton) {appendNumber("9")}
    @IBAction func numD0(_ sender: UIButton) {appendNumber("00")
    }
    
    func appendNumber(_ num: String) {
        if solved{
            lblScreen.text = num
            solved = false
            return equation = lblScreen.text!
        } else if equation.last == "%"{
            lblScreen.text = equation + "*" + num
            return equation = lblScreen.text!
        }else {
            lblError.text = ""
            lblScreen.text = equation + num
            return equation = lblScreen.text!
        }
    }
    
    @IBAction func add(_ sender: UIButton) {appendOperator("+")}
    @IBAction func subtract(_ sender: UIButton) {appendOperator("-")}
    @IBAction func multiply(_ sender: UIButton) {appendOperator("*")}
    @IBAction func divide(_ sender: UIButton) {appendOperator("/")}
    
    func appendOperator(_ op: String) {
        if equation.isEmpty {
            print("No number")
        } else if let lastChar = equation.last, operators.contains(lastChar) {
            lblError.text = ""
            equation.removeLast()
            lblScreen.text = equation + op
            return equation = lblScreen.text!
        } else {
            solved = false
            lblError.text = ""
            lblScreen.text = equation + op
            return equation = lblScreen.text!
        }
    }
    
    @IBAction func percent(_ sender: UIButton) {percentperiod("%")}
    @IBAction func period(_ sender: UIButton) {percentperiod(".")}
    
    func percentperiod(_ symbol: String){
        if equation.isEmpty{
            print("No number")
        }else if let lastchar = equation.last, operators.contains(lastchar){
            print("Invalid operation")
        }else {
            lblScreen.text = equation + symbol
            return equation = lblScreen.text!
        }    }
    
    @IBAction func clear(_ sender: UIButton) {
        lblScreen.text = ""
        return equation = lblScreen.text!
    }
    @IBAction func remove(_ sender: UIButton) {
        if equation.isEmpty {
            print("No number")
        } else{
            equation.removeLast()
            lblScreen.text = equation
        }
    }
    @IBAction func solve(_ sender: UIButton) {
        if equation.isEmpty {
            print("No number")
        } else if let lastchar = equation.last, operators.contains(lastchar) || equation.last == "."{
            lblError.text = "Error"
            print("Invalid equation")
        }else {
            var cleaned = equation.replacingOccurrences(of: "%", with: "/100.0")
            let expression = NSExpression(format: cleaned)
            
            if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                if result == result.rounded() {
                    lblScreen.text = String(Int(result))
                } else {
                    lblScreen.text = String(result)
                }
                solved = true
                return equation = lblScreen.text!
            } else {
                print("Invalid equation")
                lblScreen.text = "Error"
            }
        }
    }
}

