//
//  ViewModel.swift
//  CalculatorApp
//
//  Created by training2 on 4/7/26.
//
import Foundation
import UIKit

class calculatorViewModel {
    private var equation: String = ""                                // EQUATION TEXT
    private var errorText: String = ""                               // ERROR TEXT
    private let operators: [Character] = ["+", "-", "*", "/"]        // OPERATORS
    private var solved: Bool = false                                 // FOR NUMBERS
    private var periodPresence: Bool = false                         // FOR AVOIDING DOUBLE OCCURANCE OF PERIOD IN A NUMBER

// SHARING OF THE TEXT TO VIEW
    func getEquation() -> String {return equation}
    func getErrorText() -> String {return errorText}
// APPENDING OF NUMBER
    func appendNumber(_ num: String) {
        clearError()
        if solved{
            equation = num
            solved = false
        } else if equation.last == "%"{
            equation = equation + "*" + num
        }else {
            equation = equation + num
        }
    }
// APPENDING OF SYMBOLS
    func appendOperator(_ op: String) {
        if equation.isEmpty {
            print("No number to add operator")
        } else if let lastChar = equation.last, operators.contains(lastChar) || lastChar == "."{
            periodPresence = false
            clearError()
            equation.removeLast()
            equation = equation + op
            
        } else {
            periodPresence = false                   // ADDING AN OPERATOR INDICATED NEW NUMBER THEREFORE PRESENCE = FALSE
            clearError()
            solved = false
            equation = equation + op
        }
    }
    
    func percent(){
        if equation.isEmpty{
            print("No number to add percent")
        }else if let lastchar = equation.last, operators.contains(lastchar){
            print("Cannot add percent to operator")
        }else {
            solved = false
            equation = equation + "%"
        }
    }
    
    func period(){
        if periodPresence{
            errorText = "Error"
            print("Cannot add period")
        } else {
            if equation.isEmpty{
                print("No number to add period")
            }else if let lastchar = equation.last, operators.contains(lastchar) || equation.last == "%"{
                print("Cannot add period to operator")
                periodPresence = false
            }else {
                solved = false
                periodPresence = true
                equation = equation + "."
            }
        }
    }
// REMOVING OF CHARACTERS/TEXT IN THE EQUATION
    func clearEquation(){
        if equation.isEmpty {
            print("No number to clear")
        } else {
            errorText = ""
            solved = false
            periodPresence = false
            equation = ""
        }
    }
    
    func deleteCharacter(){
        if equation.isEmpty {
            print("No number to delete")
        } else if equation.last == "."{         // IN THE CASE OF DELETING A PERIOD, SET BOOL PRESENCE TO FALSE
            equation.removeLast()
            periodPresence = false
        }else{
            equation.removeLast()
        }
    }

// SOLVING
    func solveEquation(){
        if equation.isEmpty {
            print("No number to solve")
        } else if let lastchar = equation.last, operators.contains(lastchar){
            errorText = "Error"
            print("Invalid equation")
        }else {
            periodPresence = false
            clearError()
            var cleaned = equation.replacingOccurrences(of: ".%", with: "*1/100.0")
            cleaned = cleaned.replacingOccurrences(of: "%", with: "/100.0")
            cleaned = cleaned.replacingOccurrences(of: "−", with: "-")
            
            // If there is no proceeding number after period, change it to multiply to one
            if equation.last == "."{
                cleaned = cleaned.replacingOccurrences(of: ".", with: "*1")
            }
            if equation.last == ")"{                    // in negative sign occurance
                cleaned = cleaned.replacingOccurrences(of: ".)", with: "*1)")
            }
            
            let expression = NSExpression(format: cleaned)
            
            // Solving the equation
            if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                if result == result.rounded() {
                    equation = String(Int(result))
                } else {
                    equation = String(result)
                }
                solved = true
            } else {
                print("Invalid equation")
                errorText = "Error"
            }
        }
    }
// CLEARING ERROR TEXTS
    func clearError(){
        errorText = ""
    }
// CHANGING THE SIGN OF THE LATEST NUMBER
    func changeSign(){
        if equation.isEmpty {
            print("No number to change sign on")
        } else if let lastchar = equation.last, operators.contains(lastchar){
            print("Invalid character to change sign on")
        }else {
            let numbers = equation.components(separatedBy: CharacterSet(charactersIn: "+-*/"))
            if let curr_num = numbers.last{
                if curr_num.contains("%"){
                    print("\(curr_num)")
                } else if curr_num.contains("(−") {
                    equation.removeLast(curr_num.count)
                    var positive = curr_num.replacingOccurrences(of: "(−", with: "")
                    positive = positive.replacingOccurrences(of: ")", with: "")
                    equation = equation + positive
                } else {
                    equation.removeLast(curr_num.count)
                    equation = equation + "(−\(curr_num))"
                }
            }
        }
    }
}

