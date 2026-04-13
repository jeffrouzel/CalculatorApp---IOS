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
    
    var viewModel: calculatorViewModel = calculatorViewModel()
    
    var mainResultText: String = ""
    var mainErrorText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScreen.layer.borderWidth = 2.0
        lblScreen.layer.borderColor = UIColor.black.cgColor
        lblScreen.layer.cornerRadius = 8.0
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblScreen.text = mainResultText
        lblError.text = mainErrorText
    }
    
    func updateView(displayText: (String,String)) {
        lblScreen.text = displayText.0
        lblError.text = displayText.1
    }
    
    @IBAction func num0(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("0"))
    }
    @IBAction func num1(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("1"))}
    @IBAction func num2(_ sender: UIButton) {updateView(displayText: viewModel.appendNumber("2"))
    }
    @IBAction func num3(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("3"))
    }
    @IBAction func num4(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("4"))}
    @IBAction func num5(_ sender: UIButton) {updateView(displayText: viewModel.appendNumber("5"))
    }
    @IBAction func num6(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("6"))}
    @IBAction func num7(_ sender: UIButton) {updateView(displayText: viewModel.appendNumber("7"))
    }
    @IBAction func num8(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("8"))}
    @IBAction func num9(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("9"))
    }
    @IBAction func numD0(_ sender: UIButton) {
        updateView(displayText: viewModel.appendNumber("00"))
    }
    
    @IBAction func add(_ sender: UIButton) {
        updateView(displayText: viewModel.appendOperator("+"))
    }
    @IBAction func subtract(_ sender: UIButton) {
        updateView(displayText: viewModel.appendOperator("-"))
    }
    @IBAction func multiply(_ sender: UIButton) {
        updateView(displayText: viewModel.appendOperator("*"))
    }
    @IBAction func divide(_ sender: UIButton) {
        updateView(displayText: viewModel.appendOperator("/"))
    }
    
    
    
    @IBAction func percent(_ sender: UIButton) {
        updateView(displayText: viewModel.percent())
    }
    @IBAction func period(_ sender: UIButton) {
        updateView(displayText: viewModel.period())
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        updateView(displayText: viewModel.clearEquation())
    }
    @IBAction func remove(_ sender: UIButton) {
        updateView(displayText: viewModel.deleteCharacter())
    }

    @IBAction func change_sign(_ sender: UIButton) {
        updateView(displayText: viewModel.changeSign())
    }
    
    @IBAction func solve(_ sender: UIButton) {
        updateView(displayText: viewModel.solveEquation())
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let resultView = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController // Force to be able to acknowledge the presence of the variables
        
        // Needed to pass on values
        resultView.resultText = viewModel.getEquation()
        resultView.errorText = viewModel.getErrorText()
        self.navigationController?.pushViewController(resultView, animated: true)
    }
}

