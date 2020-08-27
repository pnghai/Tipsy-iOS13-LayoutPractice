//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTxtFld: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberLbl: UILabel!
    
    var selected : UIButton?
    @IBAction func tipChanged(_ sender: UIButton) {
        billTxtFld.endEditing(true)
        if sender != zeroPctBtn {
            zeroPctBtn.isSelected = false
        }
        if sender != tenPctBtn {
            tenPctBtn.isSelected = false
        }
        if sender != twentyPctBtn {
            twentyPctBtn.isSelected = false
        }
        sender.isSelected = true
        selected = sender
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLbl.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "splitResultShow", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "splitResultShow" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.numberOfPeople = Int(splitNumberLbl.text ?? "0") ?? 0
            destinationVC.tipPercentage = percetage(selected?.currentTitle! ?? "0.0%")
            print(billTxtFld.text)
            let billTotal: Float = Float(billTxtFld.text ?? "0") ?? 0.0
            destinationVC.tipPerPerson = (billTotal * (1 + destinationVC.tipPercentage)) / Float(destinationVC.numberOfPeople)
        }
    }
    func percetage(_ stringPercent: String) -> Float {
        return (Float(stringPercent.dropLast()) ?? 0.0) / 100.0
    }
}

