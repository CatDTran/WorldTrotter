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
    @IBAction func fahrenheitFeildEditingChanged(textField: UITextField){
        //celsiusLabel.text = textField.text
        //if display ??? if celsiusLabel.text is empty
        if let text = textField.text where !text.isEmpty{//if text field has text and it's not empty, it will set celsiusLabel
            celsiusLabel.text = text
        }else{
            celsiusLabel.text = "???"
        }
    }
}
