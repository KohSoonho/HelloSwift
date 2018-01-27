//
//  ViewController.swift
//  Calculator
//
//  Created by Atsuhiro Kou on 2018/01/27.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit
import Expression

class ViewController: UIViewController {
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // When view loaded, labels are empty.
        formulaLabel.text = ""
        answerLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputFormula(_ sender: UIButton) {
        // Push button (ewcept "C" and "=") display formula
        guard let formulaText = formulaLabel.text else {
            return
        }
        // Get title of buttons.
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
        // Connect text and display formula
        formulaLabel.text = formulaText + senderedText
    }
    
    @IBAction func clearCalculation(_ sender: UIButton) {
        // Push "C" and clear texts.
        formulaLabel.text = ""
        answerLabel.text = ""
    }
    
    @IBAction func answerCalculation(_ sender: UIButton) {
        // When push "=", display answer
        guard let formulaText = formulaLabel.text else {
            return
        }
        let formula: String = formatFormula(formulaText)
        answerLabel.text = evalFormula(formula)
    }
    
    private func formatFormula(_ formula: String) -> String {
        // If input is Int, add ".0" and change double.
        let formattedFormula: String = formula.replacingOccurrences(
            of: "(?<=^|[/*\\+\\-\\(])([0-9]+)(?=[/*\\+\\-\\)]|$)",
            with: "$1.0",
            options: NSString.CompareOptions.regularExpression,
            range: nil
            )
        return formattedFormula
    }
    
    private func evalFormula(_ formula: String) -> String {
        do {
            // Using `Expression`, evaluate String of formula
            let expression = Expression(formula)
            let answer = try expression.evaluate()
            return formatAnswer(String(answer))
        } catch {
            // ilegal formula
            return "式を正しく入力してください"
        }
    }
    
    private func formatAnswer(_ answer: String) -> String {
        // If answer is Int, delete ".0".
        let formattedAnswer: String = answer.replacingOccurrences(
            of: "\\.0$",
            with: "",
            options: NSString.CompareOptions.regularExpression,
            range: nil)
        return formattedAnswer
    }

}

