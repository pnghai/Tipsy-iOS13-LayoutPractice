//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Hai Phan Nguyen on 26/08/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain{
    let tipPct : Float = 0.0
    let splitNumber : Int = 1
    let billTotal: Float = 0.0
    func funct getResult() -> Float {
        return (billTotal * (1 + tipPct)) / Float(splitNumber)
    }
}
