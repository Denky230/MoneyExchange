//
//  HackViewController.swift
//  MoneyExchange
//
//  Created by dmorenoar on 10/11/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class HackViewController: UIViewController {
    
    var numberInputField: NumberNaturalTextField = NumberNaturalTextField()
    @IBOutlet weak var newCoinValue: UITextField!
    
    // PickerView
    var coinPicker: CoinPicker = CoinPicker()
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func btnApply(_ sender: UIButton) {
        let newValue = Double(newCoinValue.text!)!
        coins[coinPicker.selectedRow(inComponent: 0)].setValue(newValue: newValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initPickerView()
        initTextField()
    }
    
    func initPickerView() {
        pickerView.delegate = coinPicker
        coinPicker.initialize(numComponents: 1)
    }
    func initTextField() {
        newCoinValue.delegate = numberInputField
        newCoinValue.keyboardType = .numberPad
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
