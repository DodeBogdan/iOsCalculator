//
//  ViewController.swift
//  Calculator
//
//  Created by Dode on 22/02/2022.
//

import UIKit

class ViewController: UIViewController {

    //This is the UI var related for the displayed value
    @IBOutlet weak var displayedTestLabel: UILabel!
    
    //This is the var responsible for currentTextView
    var currentTextThatShouldBeDisplayed:String = ""
    
    //This is the var responsible for lastText
    var lastTextView:String = ""
    
    //This is the var responsible for keep the last pushed sign
    var lastPressedSign:String = ""
    
    
    //This is the function for write the currentValue to display
    func displayValue(value:String)
    {
        if lastPressedSign != "."{
            if currentTextThatShouldBeDisplayed == "0"{
                currentTextThatShouldBeDisplayed = ""
            }
            
            
            
        }
    }
    
    
    //This is the function for the buttons. All buttons have reference to buttonActioner
    @IBAction func buttonActioner(_ sender: UIButton) {
        
        //get the current value from sender
        let currentValue:String = sender.currentTitle!
        
        displayValue(value: currentValue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

