//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Sriracha Sauce on 6/2/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit

//protocols that a class conforms with are in a comma-delimited list follow after the superclass (if any)
//in class's decleration
class ConversionViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let date = NSDate()//get a date object
        let calendar = NSCalendar.currentCalendar() //get current calendar
        let hour = calendar.component(.Hour, fromDate: date)    //extract hour component from calendar object
        print("Hour is: ", hour)
        if hour >= 17 { //change background color in the evening
            view.backgroundColor = UIColor.grayColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() //always call super's method when override
        print("Conversion View Controller loaded its view")
    }
    
    //restrict maximum and minimum fractions digits
    let numberFormatter: NSNumberFormatter = {  //using Swift's closure to instantiate an NSNumberFormatter
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //convert fahrenheit to celsius value here
    var celsiusValue: Double?{
        if let value = fahrenheitValue{//check if there is fahrenheitValue, if there is, convert to celsius
            return (value - 32) * (5/9)
        }
        else{//if not, return nil
            return nil
        }
    }
    
    //update the celsius label
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)//set text using NSNumberFormatter
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    //called whenever farenheit TextField is changed
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
    
    //called to dismiss keyboard on screen
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    //implementing the protocol
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
        //print("Current text: \(textField.text)")
        //print("Replacement text: \(string)")
        //return true
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            return false
        }
        else{
            return true
        }
    }
}
