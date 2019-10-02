//
//  ViewController.swift
//  Calculator
//
//  Created by Balnur Sakhybekova on 10/1/19.
//  Copyright © 2019 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    var inTheMid : Bool = false

    @IBAction func digitButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let display = displayLabel.text!
        if inTheMid {
            displayLabel.text = display + digit}
        else {
            displayLabel.text = digit
            inTheMid = true}
    }
    
    var displayValue : Double {
        get {return Double(displayLabel.text!)!}
        set {displayLabel.text = String(newValue)}
    }
    
    var brain = Brain()
    
    @IBAction func operButton(_ sender: UIButton) {
        
        if inTheMid {
            brain.setOper(operand: displayValue)
            inTheMid = false
        }
        
        
        if let mathSymbol = sender.currentTitle{
            brain.performOper(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
    
}

