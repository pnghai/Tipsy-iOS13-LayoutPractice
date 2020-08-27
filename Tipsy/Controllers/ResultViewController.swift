//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Hai Phan Nguyen on 26/08/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var numberOfPeople: Int = 0
    var tipPercentage: Float = 0.0
    var tipPerPerson: Float = 0.0
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var settingsLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLbl.text = String(format: "%.2f", tipPerPerson)
        settingsLbl.text = "Split between \(numberOfPeople) people, with \(tipPercentage*100)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
