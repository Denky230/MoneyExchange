//
//  HackViewController.swift
//  MoneyExchange
//
//  Created by dmorenoar on 10/11/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class HackViewController: UIViewController {
    
    @IBOutlet weak var newCoinValue: UITextField!
    
    // TO DO: extract field delegates from main
    
    // PickerView
    var coinPicker: CoinPicker = CoinPicker()
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initPickerView()
    }
    
    func initPickerView() {
        pickerView.delegate = coinPicker
        coinPicker.initialize(numComponents: 1)
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
