	//
//  ResultViewController.swift
//  CalculatorApp
//
//  Created by training2 on 4/10/26.
//
import UIKit

class ResultViewController: UIViewController{
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblError: UILabel!
    var viewModel: calculatorViewModel = calculatorViewModel()
    
    var resultText: String = ""
    var errorText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.layer.borderWidth = 2.0
        lblResult.layer.borderColor = UIColor.black.cgColor
        lblResult.layer.cornerRadius = 8.0
        
        lblResult.text = resultText
        lblError.text = errorText
        }
    
    func updateView(displayText: (String,String)) {
        lblResult.text = displayText.0
        lblError.text = displayText.1
    }

    @IBAction func popResultViewController(_ sender: UIButton) {
        updateView(displayText: viewModel.clearEquation())
        let homeView = ViewController(nibName: "ViewController", bundle: nil)
        homeView.resultText = viewModel.getEquation()
        homeView.errorText = viewModel.getErrorText()
        self.navigationController?.popViewController(animated: true)
        
    }
}

