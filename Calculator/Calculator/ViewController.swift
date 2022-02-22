//
//  ViewController.swift
//  Calculator
//
//  Created by Dode on 22/02/2022.
//

import UIKit

class ViewController: UIViewController {

    //This is the UI var related for the displayed value
    @IBOutlet weak var displayedTextLabel: UILabel!
    
    //This is the var responsible for currentTextView
    var currentTextThatShouldBeDisplayed:String = ""
    
    //This is the var responsible for lastText
    var lastTextView:String = ""
    
    //This is the var responsible for keep the last pushed sign
    var lastPressedSign:String = ""
    
    //This is function that calculate value
    func calculateValue(firstValue:String, secondValue:String) -> String{
        
        let firstValueAsDouble:Double = Double(firstValue)!
        let secondValueAsDouble:Double = Double(secondValue)!
        
        var result:Double = 0
        
        switch lastPressedSign {
        case "+":
            result = firstValueAsDouble + secondValueAsDouble
            break
        case "-":
            result = secondValueAsDouble - firstValueAsDouble
            break
        case "/":
            result = secondValueAsDouble / firstValueAsDouble
            break
        case "X":
            result = firstValueAsDouble * secondValueAsDouble
            break
        default:
            break
                
        }
        
        let resultAsString:String = String(format: "%.2f", result)
        return resultAsString
    }
    
    //This is the function for write the currentValue to display
    func displayValue(value:String)
    {
        if value != "."{
            if currentTextThatShouldBeDisplayed == "0"{
                currentTextThatShouldBeDisplayed = ""
            }
            
            switch value {
            //cases where value is digit
            case "0":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)0"
                break
            case "1":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)1"
                break
            case "2":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)2"
                break
            case "3":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)3"
                break
            case "4":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)4"
                break
            case "5":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)5"
                break
            case "6":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)6"
                break
            case "7":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)7"
                break
            case "8":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)8"
                break
            case "9":
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)9"
                break
            
            //case where value is erase / c
            case "C":
                if currentTextThatShouldBeDisplayed.count != 0{
                    currentTextThatShouldBeDisplayed.removeLast()
                }
                break;
                
            //case where value is %
            case "%":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                let doubleValue:Double = Double(currentTextThatShouldBeDisplayed)!
                currentTextThatShouldBeDisplayed = "\(1/doubleValue)"
                break;
                
            //case where value is '/'
            case "/":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                if lastPressedSign == ""{
                    lastTextView = currentTextThatShouldBeDisplayed
                    currentTextThatShouldBeDisplayed = "0"
                    lastPressedSign = "/"
                }else{
                    currentTextThatShouldBeDisplayed = calculateValue(firstValue: currentTextThatShouldBeDisplayed, secondValue: lastTextView)
                    
                    lastTextView = ""
                    lastPressedSign = ""
                }
                break
                
                //case when value is X
            case "X":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                if lastPressedSign == ""{
                    lastTextView = currentTextThatShouldBeDisplayed
                    currentTextThatShouldBeDisplayed = "0"
                    lastPressedSign = "X"
                }else{
                    currentTextThatShouldBeDisplayed = calculateValue(firstValue: currentTextThatShouldBeDisplayed, secondValue: lastTextView)
                    
                    lastTextView = ""
                    lastPressedSign = ""
                }
                break
                
            //case when value is +
            case "+":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                if lastPressedSign == ""{
                    lastTextView = currentTextThatShouldBeDisplayed
                    currentTextThatShouldBeDisplayed = "0"
                    lastPressedSign = "+"
                }else{
                    currentTextThatShouldBeDisplayed = calculateValue(firstValue: currentTextThatShouldBeDisplayed, secondValue: lastTextView)
                    
                    lastTextView = ""
                    lastPressedSign = ""
                }
                break
                
            //case when value is -
            case "-":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                if lastPressedSign == ""{
                    lastTextView = currentTextThatShouldBeDisplayed
                    currentTextThatShouldBeDisplayed = "0"
                    lastPressedSign = "-"
                }else{
                    currentTextThatShouldBeDisplayed = calculateValue(firstValue: currentTextThatShouldBeDisplayed, secondValue: lastTextView)
                    
                    lastTextView = ""
                    lastPressedSign = ""
                }
                break
                
            //case when value is =
            case "=":
                if currentTextThatShouldBeDisplayed == ""{
                    break
                }
                if lastTextView == ""
                {break}
                
                currentTextThatShouldBeDisplayed = calculateValue(firstValue: currentTextThatShouldBeDisplayed, secondValue: lastTextView)
            
                lastTextView = ""
                break
            //case when value is -/+
            case "+/-":
                if currentTextThatShouldBeDisplayed.first == "-"{
                    currentTextThatShouldBeDisplayed.removeFirst()
                }else{
                    currentTextThatShouldBeDisplayed = "-\(currentTextThatShouldBeDisplayed)"
                }
                break
            default:
                break
            }
        }else{
            if !currentTextThatShouldBeDisplayed.contains("."){
                currentTextThatShouldBeDisplayed = "\(currentTextThatShouldBeDisplayed)."
            }
        }
        
        //display current value to screen
        displayedTextLabel.text = currentTextThatShouldBeDisplayed
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

