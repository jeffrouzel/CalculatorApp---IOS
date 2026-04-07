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
    
    let viewModel = calculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScreen.layer.borderWidth = 2.0
        lblScreen.layer.borderColor = UIColor.black.cgColor
        lblScreen.layer.cornerRadius = 8.0
        
        lblScreen.text = ""
        lblError.text = ""
        }
    
    func updateView() {
        lblScreen.text = viewModel.getEquation()
        lblError.text = viewModel.getErrorText()
    }
    
    @IBAction func num0(_ sender: UIButton) {viewModel.appendNumber("0"); updateView()}
    @IBAction func num1(_ sender: UIButton) {viewModel.appendNumber("1"); updateView()}
    @IBAction func num2(_ sender: UIButton) {viewModel.appendNumber("2"); updateView()}
    @IBAction func num3(_ sender: UIButton) {viewModel.appendNumber("3"); updateView()}
    @IBAction func num4(_ sender: UIButton) {viewModel.appendNumber("4"); updateView()}
    @IBAction func num5(_ sender: UIButton) {viewModel.appendNumber("5"); updateView()}
    @IBAction func num6(_ sender: UIButton) {viewModel.appendNumber("6"); updateView()}
    @IBAction func num7(_ sender: UIButton) {viewModel.appendNumber("7"); updateView()}
    @IBAction func num8(_ sender: UIButton) {viewModel.appendNumber("8"); updateView()}
    @IBAction func num9(_ sender: UIButton) {viewModel.appendNumber("9"); updateView()}
    @IBAction func numD0(_ sender: UIButton) {viewModel.appendNumber("00"); updateView()}
    
    @IBAction func add(_ sender: UIButton) {viewModel.appendOperator("+"); updateView()}
    @IBAction func subtract(_ sender: UIButton) {viewModel.appendOperator("-"); updateView()}
    @IBAction func multiply(_ sender: UIButton) {viewModel.appendOperator("*"); updateView()}
    @IBAction func divide(_ sender: UIButton) {viewModel.appendOperator("/"); updateView()}
    
    
    
    @IBAction func percent(_ sender: UIButton) {viewModel.percent(); updateView()}
    @IBAction func period(_ sender: UIButton) {viewModel.period(); updateView()}
    
    
    @IBAction func clear(_ sender: UIButton) { viewModel.clearEquation(); updateView() }
    @IBAction func remove(_ sender: UIButton) {viewModel.deleteCharacter(); updateView()}
    @IBAction func solve(_ sender: UIButton) {viewModel.solveEquation(); updateView()}
    @IBAction func change_sign(_ sender: UIButton) {viewModel.changeSign(); updateView()}
}

