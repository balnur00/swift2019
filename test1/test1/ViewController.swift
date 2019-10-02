//
//  ViewController.swift
//  test1
//
//  Created by Balnur Sakhybekova on 9/4/19.
//  Copyright © 2019 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var previousNum:Double = 0;
    var mathOper:Bool = false;
    var operation = 0;
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if mathOper == true {
            myLabel.text = String(sender.tag)
            numberOnScreen = Double(myLabel.text!)!
            mathOper = false
        }
        else{
            myLabel.text = myLabel.text! + String(sender.tag)
            numberOnScreen = Double(myLabel.text!)!
        }
    }
    
    @IBAction func operPressed(_ sender: UIButton) {
        if myLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNum = Double(myLabel.text!)!
            if sender.tag == 12 { //div
                myLabel.text = "/";
            }
            else if sender.tag == 13 { //mul
                myLabel.text = "x";
            }
            else if sender.tag == 14 { //min
                myLabel.text = "-";
            }
            else if sender.tag == 15 { //plus
                myLabel.text = "+"
            }
            operation = sender.tag;
            mathOper = true;
        }
        if sender.tag == 16 {
            if operation == 12 {
                myLabel.text = String(previousNum / numberOnScreen);
            }
            else if operation == 13 {
                myLabel.text = String(previousNum * numberOnScreen);
            }
            else if operation == 14 {
                myLabel.text = String(previousNum - numberOnScreen);
            }
            else if operation == 15 {
                myLabel.text = String(previousNum + numberOnScreen);
            }
        }
        else if sender.tag == 11 {
            myLabel.text = ""
            previousNum = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

