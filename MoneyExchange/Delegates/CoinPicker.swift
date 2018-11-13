//
//  CoinPicker.swift
//  MoneyExchange
//
//  Created by dmorenoar on 13/11/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class CoinPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var numComponents: Int = 0
    var coinComponents: [Coin] = []
    
    public func initialize(numComponents: Int) {
        setNumComponents(numComponents: numComponents)
    }
    
    func setNumComponents(numComponents: Int) {
        for _ in 0 ..< numComponents {
            coinComponents.append(coins[0])
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return coinComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coins[row].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinComponents[component] = coins[row]
    }
}
