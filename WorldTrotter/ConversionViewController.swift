//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Sriracha Sauce on 6/2/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double?{
        if let value = fahrenheitValue{//check if there is fahrenheitValue, if there is, convert to celsius
            return (value - 32) * (5/9)
        }
        else{//if not, return nil
            return nil
        }
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = "\(value)"
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFeildEditingChanged(textField: UITextField){
        //celsiusLabel.text = textField.text
        //if display ??? if celsiusLabel.text is empty
        if let text = textField.text, value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
}
